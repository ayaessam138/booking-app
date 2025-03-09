import 'package:bookingapp/core/helpers/app_const.dart';
import 'package:bookingapp/core/localstorage/loacal_data_source.dart';
import 'package:bookingapp/core/network/network_info.dart';
import 'package:bookingapp/feature/events/domain/entity/events_deatils_entity.dart';
import 'package:bookingapp/feature/events/domain/entity/events_entity.dart';
import 'package:bookingapp/feature/events/domain/repo/events_repo.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:hive/hive.dart';
part 'events_cubit.freezed.dart';

@freezed
class EventsState<T> with _$EventsState<T> {
  const factory EventsState.initial() = _Initial;
  const factory EventsState.eventsLoading() = EventsLoading;
  const factory EventsState.eventsPagination() = EventsPagination;
  const factory EventsState.eventsSuccess(T data) = EventsSuccess;
  const factory EventsState.eventsError({required String error}) = EventsError;
  const factory EventsState.eventsDetailsLoading() = EventsDetailsLoading;
  const factory EventsState.eventsDetailsSuccess(T data) = EventsDetailsSuccess;
  const factory EventsState.eventsDetailsError({required String error}) =
      EventsDetailsError;
  const factory EventsState.noInternet() = NoInternet;
  const factory EventsState.saveEvent() = saveEvent;
}

class EventsCubit extends Cubit<EventsState> {
  final EventsRepo eventsRepo;
  final LocalDataSource localDataSource;
  final NetworkInfo networkInfo;
  EventsCubit({
    required this.networkInfo,
    required this.eventsRepo,
    required this.localDataSource,
  }) : super(const EventsState.initial());

  static EventsCubit of(BuildContext context) => context.read<EventsCubit>();

  int currentPageNumber = 1;
  bool isReachedEndEvents = false;
  List<EventsEntity> eventsList = [];

  reset() {
    currentPageNumber = 1;
    isReachedEndEvents = false;
    eventsList = [];
  }

  // Future getEvents({bool isPagination = false, bool isRefresh = false}) async {
  //   print("ayaaaaaaaaaaaaaaaa");
  //   bool isRequestCashed = localDataSource.isRequestCashed(
  //     key: AppSavedKey.events,
  //     box: Hive.box(AppSavedKey.globalBox),
  //   );

  //   if (isRefresh || !isRequestCashed){ emit(const EventsState.eventsLoading());};
  //   if (isRefresh) reset();
  //   if (isPagination) {
  //     currentPageNumber++;
  //     emit(const EventsState.eventsPagination());
  //   }
  //   bool isConnected = await networkInfo.isConnected();
  //   print("isconnected");
  //   print(isConnected);
  //   if (!isConnected) {
  //     emit(const EventsState.noInternet());
  //     return;
  //   }
  //   print("isconnected");
  //   print(isConnected);
  //   final result = await eventsRepo.getEvents(
  //     currentPageNumber: currentPageNumber,
  //     isPagination: isPagination,
  //     isRefresh: isRefresh,
  //     isRequestCashed: isRequestCashed,
  //     savedKey: AppSavedKey.events,
  //   );

  //   result.when(
  //     success: (data) {
  //       var response = data;
  //       isReachedEndEvents = response.isEmpty;

  //       if (isPagination) {
  //         if (!isReachedEndEvents) {
  //           eventsList.addAll(response);
  //         }
  //       } else {
  //         eventsList = response;
  //       }
  //       emit(EventsState.eventsSuccess(data));
  //     },
  //     failure: (error) {
  //       if (error.apiErrorModel.message == "No Internet Connection") {
  //         emit(const EventsState.noInternet());
  //       } else {
  //         emit(
  //           EventsState.eventsError(error: error.apiErrorModel.message ?? ''),
  //         );
  //       }
  //     },
  //   );
  // }
  var net = false;
  Future<void> getEvents({
    bool isPagination = false,
    bool isRefresh = false,
  }) async {
    bool isRequestCached = localDataSource.isRequestCashed(
      key: AppSavedKey.events,
      box: Hive.box(AppSavedKey.globalBox),
    );
    bool isConnected = await networkInfo.isConnected();

    net = isConnected;
    if (!isConnected) {
      emit(const EventsState.noInternet());

      return;
    }
    if (isRefresh || !isRequestCached) {
      emit(const EventsState.eventsLoading());
    }

    if (isRefresh) reset();
    if (isPagination) {
      currentPageNumber++;
      emit(const EventsState.eventsPagination());
    }

    // Fetch new data from API
    final result = await eventsRepo.getEvents(
      currentPageNumber: currentPageNumber,
      isPagination: isPagination,
      isRefresh: isRefresh,
      isRequestCashed: isRequestCached,
      savedKey: AppSavedKey.events,
    );

    result.when(
      success: (data) {
        isReachedEndEvents = data.isEmpty;
        if (isPagination) {
          if (!isReachedEndEvents) {
            eventsList.addAll(data);
          }
        } else {
          eventsList = data;
        }
        emit(EventsState.eventsSuccess(data));
      },
      failure: (error) {
        emit(EventsState.eventsError(error: error.apiErrorModel.message ?? ''));
      },
    );
  }

  EventDeatilsEntity eventDeatilsEntity = EventDeatilsEntity();
  Future getEventDeatils({required String id, bool isRefresh = false}) async {
    if (isRefresh) {
      eventDeatilsEntity = EventDeatilsEntity();
      emit(const EventsState.eventsDetailsLoading());
    }
    bool isConnected = await networkInfo.isConnected();

    if (!isConnected) {
      emit(const EventsState.noInternet());
      return;
    }

    emit(const EventsState.eventsDetailsLoading());
    final result = await eventsRepo.getEventDeatils(
      id: id,
      isRefresh: isRefresh,
    );
    result.when(
      success: (data) {
        eventDeatilsEntity = data;
        emit(EventsState.eventsDetailsSuccess(data));
      },
      failure: (error) {
        emit(
          EventsState.eventsDetailsError(
            error: error.apiErrorModel.message ?? '',
          ),
        );
      },
    );
  }

  Future<void> shareEventWithImage(EventsEntity event) async {
    try {
      final tempDir = await getTemporaryDirectory();
      final tempPath = '${tempDir.path}/event_image.jpg';

      await Dio().download(event.picture, tempPath);

      final XFile imageFile = XFile(tempPath);

      final String message = '''
 ${event.title}
 Location: ${event.address}

Check out this event! 
''';

      await Share.shareXFiles([imageFile], text: message, subject: event.title);
    } catch (e) {
      print(" Error sharing event: $e");
    }
  }



}

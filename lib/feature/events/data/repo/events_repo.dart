import 'package:bookingapp/core/helpers/app_const.dart';
import 'package:bookingapp/core/network/api_result.dart';
import 'package:bookingapp/core/error_handle/error_handler.dart';
import 'package:bookingapp/core/network/network_info.dart';
import 'package:bookingapp/core/localstorage/loacal_data_source.dart';
import 'package:bookingapp/feature/events/data/datasource/events_datasource.dart';
import 'package:bookingapp/feature/events/data/models/events_model.dart';
import 'package:bookingapp/feature/events/domain/entity/events_deatils_entity.dart';
import 'package:bookingapp/feature/events/domain/entity/events_entity.dart';
import 'package:bookingapp/feature/events/domain/repo/events_repo.dart';
import 'package:dio/dio.dart';
import 'package:hive/hive.dart';

class EventsRepoImpl implements EventsRepo {
  final NetworkInfo networkInfo;
  final LocalDataSource localDataSource;
  final EventsDatasource eventsDatasource;

  EventsRepoImpl({
    required this.eventsDatasource,
    required this.localDataSource,
    required this.networkInfo,
  });

  @override
  Future<ApiResult<List<EventsEntity>>> getEvents({
    required int currentPageNumber,
    required bool isPagination,
    required bool isRefresh,
    required bool isRequestCashed,
    required String savedKey,
  }) async {
    try {
      // bool isConnected = await networkInfo.isConnected();

      bool isApiCall = (!isRequestCashed || isPagination || isRefresh);

      if (isApiCall) {
        final response = await eventsDatasource.getEvents(
          currentPageNumber: currentPageNumber,
        );

        final List<EventsEntity> eventsListEntity = response.data.toEntity();

        await localDataSource.save(
          data: response.toJson(),
          key: savedKey,
          box: Hive.box(AppSavedKey.globalBox),
        );
        await localDataSource.cashRequest(
          key: savedKey,
          cashWhen: eventsListEntity.isNotEmpty,
          box: Hive.box(AppSavedKey.globalBox),
        );

        return ApiResult.success(eventsListEntity);
      } else {
        final response = await localDataSource.get(
          key: savedKey,
          box: Hive.box(AppSavedKey.globalBox),
        );
        final cachedEvents = EventsDataModel.fromJson(response).toEntity();

        return ApiResult.success(cachedEvents);
      }
    } on DioException catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }

  @override
  Future<ApiResult<EventDeatilsEntity>> getEventDeatils({
    required String id,
    required bool isRefresh,
  }) async {
    try {
      bool isApiCall = await networkInfo.isConnected() && (isRefresh);

      if (isApiCall) {
        final response = await eventsDatasource.getEventsDeatails(id: id);

        final EventDeatilsEntity eventsListEntity = response.data!.toEntity();

        return ApiResult.success(eventsListEntity);
      } else {
        final response = await eventsDatasource.getEventsDeatails(id: id);

        final EventDeatilsEntity eventsListEntity = response.data!.toEntity();
        return ApiResult.success(eventsListEntity);
      }
    } on DioException catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}

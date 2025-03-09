import 'package:bookingapp/core/helpers/app_const.dart';
import 'package:bookingapp/core/network/dio_client.dart';
import 'package:bookingapp/feature/events/data/models/event_details_model.dart';
import 'package:bookingapp/feature/events/data/models/events_model.dart';

abstract class EventsDatasource {
  Future<EventsModel> getEvents({required int currentPageNumber});
  Future<EventDetailsModel> getEventsDeatails({required String id});
}

class EventsDatasourceImpl implements EventsDatasource {
  final DioClient dioClient;

  EventsDatasourceImpl({required this.dioClient});
  @override
  Future<EventsModel> getEvents({required int currentPageNumber}) async {
    final response = await dioClient.get(
      '${ApiConstants.getEvents}?page=$currentPageNumber',
    );
    return EventsModel.fromJson(response.data);
  }

  @override
  Future<EventDetailsModel> getEventsDeatails({required String id})async {
    final response = await dioClient.get(
      '${ApiConstants.getEvents}/$id',
    );
    return EventDetailsModel.fromJson(response.data);
  }
}

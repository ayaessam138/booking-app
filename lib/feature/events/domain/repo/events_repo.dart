import 'package:bookingapp/core/network/api_result.dart';
import 'package:bookingapp/feature/events/domain/entity/events_deatils_entity.dart';
import 'package:bookingapp/feature/events/domain/entity/events_entity.dart';

abstract class EventsRepo {
  Future<ApiResult<List<EventsEntity>>> getEvents({
    required int currentPageNumber,
    required bool isPagination,
    required bool isRefresh,
    required bool isRequestCashed,
    required String savedKey,
  });
  Future<ApiResult<EventDeatilsEntity>> getEventDeatils({
    required String id,
    required bool isRefresh,
  });
}

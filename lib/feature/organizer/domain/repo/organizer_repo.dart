import 'package:bookingapp/core/network/api_result.dart';
import 'package:bookingapp/feature/organizer/domain/entity/organizer_entity.dart' show OrganizerEntity;

abstract class OrganizerRepo {

  Future<ApiResult<OrganizerEntity>> getOrganizerDeatils({
    required String id,
    required bool isRefresh,

  });
}
import 'package:bookingapp/core/network/api_result.dart';
import 'package:bookingapp/core/error_handle/error_handler.dart';
import 'package:bookingapp/core/network/network_info.dart';
import 'package:bookingapp/feature/organizer/data/data_source/organizer_data_source.dart';
import 'package:bookingapp/feature/organizer/domain/entity/organizer_entity.dart';
import 'package:bookingapp/feature/organizer/domain/repo/organizer_repo.dart';
import 'package:dio/dio.dart';

class OrganizerRepoImpl implements OrganizerRepo {
  final NetworkInfo networkInfo;

  final OrganizerDatasource oganizerDatasource;

  OrganizerRepoImpl({
    required this.oganizerDatasource,
    required this.networkInfo,
  });

  @override
  Future<ApiResult<OrganizerEntity>> getOrganizerDeatils({
    required String id,
    required bool isRefresh,

  }) async {
    try {
      bool isApiCall = await networkInfo.isConnected() && (isRefresh);

      if (isApiCall) {
        final response = await oganizerDatasource.getOrganizerDeatails(id: id);

        final OrganizerEntity organizerListEntity = response.toEntity();

        return ApiResult.success(organizerListEntity);
      } else {
        final response = await oganizerDatasource.getOrganizerDeatails(id: id);

        final OrganizerEntity organizerListEntity = response.toEntity();
        return ApiResult.success(organizerListEntity);
      }
    } on DioException catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}

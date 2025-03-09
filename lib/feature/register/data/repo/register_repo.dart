import 'package:bookingapp/core/error_handle/error_handler.dart';
import 'package:bookingapp/core/network/api_result.dart';
import 'package:bookingapp/feature/register/data/datasource/register_datasource.dart';
import 'package:bookingapp/feature/register/data/model/registe_model.dart';
import 'package:bookingapp/feature/register/domain/entity/register_entity.dart';
import 'package:bookingapp/feature/register/domain/repo/register_repo.dart';
import 'package:dio/dio.dart';

class RegisterRepoImpl implements RegisterRepo {
  final RegisterDatasource registerDatasource;

  RegisterRepoImpl({required this.registerDatasource});

  @override
  Future<ApiResult<RegisterModel>> register({
    required RegisterParamsEntity registerEntity,
  }) async {
    try {
      final response = await registerDatasource.register(
        registerParamsEntity: registerEntity,
      );
      return ApiResult.success(response);
    } on DioException catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}

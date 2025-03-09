import 'package:bookingapp/core/helpers/app_const.dart';
import 'package:bookingapp/core/network/dio_client.dart';
import 'package:bookingapp/feature/register/data/model/registe_model.dart';
import 'package:bookingapp/feature/register/data/model/register_params.dart';
import 'package:bookingapp/feature/register/domain/entity/register_entity.dart';

abstract class RegisterDatasource {
  Future<RegisterModel> register({
    required RegisterParamsEntity registerParamsEntity,
  });
}

class RegisterDatasourceImpl implements RegisterDatasource {
  final DioClient dioClient;

  RegisterDatasourceImpl({required this.dioClient});
  @override
  @override
  Future<RegisterModel> register({
    required RegisterParamsEntity registerParamsEntity,
  }) async {
    RegisterParams registerParams = RegisterParams.fromEntity(
      registerParamsEntity,
    );
    final response = await dioClient.post(
      data: registerParams.toJson(),

      ApiConstants.register,
    );
    return RegisterModel.fromJson(response.data);
  }
}

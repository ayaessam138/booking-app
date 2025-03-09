import 'package:bookingapp/core/network/api_result.dart';
import 'package:bookingapp/feature/register/data/model/registe_model.dart';
import 'package:bookingapp/feature/register/domain/entity/register_entity.dart';

abstract class RegisterRepo {
   Future<ApiResult<RegisterModel>>register({required RegisterParamsEntity registerEntity});

  static registerRepo({required String id}) {}
}

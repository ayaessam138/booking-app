import 'package:bookingapp/feature/register/data/model/registe_model.dart';
import 'package:bookingapp/feature/register/domain/entity/register_entity.dart';
import 'package:bookingapp/feature/register/domain/repo/register_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'register_cubit.freezed.dart';

@freezed
class RegisterState<T> with _$RegisterState<T> {
  const factory RegisterState.initial() = _Initial;

  const factory RegisterState.RegisterLoading() = RegisterLoading;
  const factory RegisterState.RegisterSuccess(T data) = RegisterSuccess;
  const factory RegisterState.RegisterError({required String error}) =
      RegisterError;
}

class RegisterCubit extends Cubit<RegisterState> {
  final RegisterRepo registerRepo;

  RegisterCubit({required this.registerRepo})
    : super(const RegisterState.initial());

  static RegisterCubit of(BuildContext context) =>
      context.read<RegisterCubit>();

  RegisterModel registerModel = RegisterModel();
  Future getRegisterDeatils({
    required RegisterParamsEntity registerEntity,
  }) async {
    emit(const RegisterState.RegisterLoading());
    final result = await registerRepo.register(registerEntity: registerEntity);
    result.when(
      success: (data) {
        registerModel = data;

        emit(RegisterState.RegisterSuccess(data));
      },
      failure: (error) {
        emit(
          RegisterState.RegisterError(error: error.apiErrorModel.message ?? ''),
        );
      },
    );
  }
}

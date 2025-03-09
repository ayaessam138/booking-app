import 'package:bookingapp/core/network/network_info.dart';
import 'package:bookingapp/feature/organizer/domain/entity/organizer_entity.dart';
import 'package:bookingapp/feature/organizer/domain/repo/organizer_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'organizer_cubit.freezed.dart';

@freezed
class OrganizerState<T> with _$OrganizerState<T> {
  const factory OrganizerState.initial() = _Initial;

  const factory OrganizerState.organizerDetailsLoading() =
      OrganizerDetailsLoading;

  const factory OrganizerState.organizerDetailsSuccess(T data) =
      OrganizerDetailsSuccess;
  const factory OrganizerState.organizerDetailsError({required String error}) =
      OrganizerDetailsError;
  const factory OrganizerState.noInternet() = NoInternet;
}

class OrganizerCubit extends Cubit<OrganizerState> {
  final OrganizerRepo organizerRepo;
  final NetworkInfo networkInfo;
  OrganizerCubit( {required this.organizerRepo,required this.networkInfo})
    : super(const OrganizerState.initial());

  static OrganizerCubit of(BuildContext context) =>
      context.read<OrganizerCubit>();

  OrganizerEntity organizerEntity = OrganizerEntity();
  Future getOrganizerDeatils({
    required String id,
    bool isRefresh = false,
  }) async {
    if (isRefresh) {
      organizerEntity = OrganizerEntity();
      emit(const OrganizerState.organizerDetailsLoading());
    }
    bool isConnected = await networkInfo.isConnected();
    if (!isConnected) {
      emit(const OrganizerState.noInternet());
      return;
    }
    emit(const OrganizerState.organizerDetailsLoading());
    final result = await organizerRepo.getOrganizerDeatils(
      id: id,
      isRefresh: isRefresh,
    );
    result.when(
      success: (data) {
        organizerEntity = data;

        emit(OrganizerState.organizerDetailsSuccess(data));
      },
      failure: (error) {
        emit(
          OrganizerState.organizerDetailsError(
            error: error.apiErrorModel.message ?? '',
          ),
        );
      },
    );
  }
}

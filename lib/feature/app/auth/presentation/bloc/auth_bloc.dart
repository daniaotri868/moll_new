import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:remy/common/models/page_state/page_state.dart';
// import 'package:remy/core/api/params.dart';
import '../../../../../common/models/page_state/bloc_status.dart';
import '../../../../../core/api/result.dart';

import '../../../../../core/use_case/use_case.dart';
import '../../data/model/all_area.dart';
import '../../data/model/calculateGeoLocationReverse.dart';
import '../../data/model/profile_model.dart';
import '../../domain/use_case/area_usecase.dart';
import '../../domain/use_case/check_code_use_case.dart';
import '../../domain/use_case/get_profile_usecase.dart';
import '../../domain/use_case/register_use_case.dart';
import '../../domain/use_case/update_profile_use_case.dart';

part 'auth_event.dart';

part 'auth_state.dart';

@injectable
class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final RegisterUseCase registerUseCase;
  final CheckCodeUseCase checkCodeUseCase;
  final UpdateProfileUseCase updateProfileUseCase;
  final GetProfileUseCase getProfileUseCase;
  final AreaUseCase areaUseCase;

  AuthBloc(
    this.registerUseCase,
    this.checkCodeUseCase,
    this.updateProfileUseCase, this.getProfileUseCase, this.areaUseCase,
  ) : super(const AuthState()) {
    on<RegisterEvent>(_onLoginEvent);
    on<CheckCodeEvent>(_onCheckCodeEvent);
    on<UpdateUserInfoEvent>(_updateUserInfoEvent);
    on<GetProfileEvent>(_onGetProfileEvent);
    on<AllAreaEvent>(_onAllAreaEvent);

  }



  FutureOr<void> _onLoginEvent(
      RegisterEvent event, Emitter<AuthState> emit) async {
    emit(state.copyWith(registerStatus: const BlocStatus.loading()));
    final result = await registerUseCase(RegisterParams(password: event.password,email: event.email,deviceToken: event.deviceToken));
    switch (result) {
      case Success(value: final data):
        emit(state.copyWith(
            registerStatus: const BlocStatus.success(),
           ));
        event.onSuccess();
      case Failure(exception: final exception, message: final message):
        emit(state.copyWith(
          registerStatus: BlocStatus.fail(error: message),
        ));
    }
  }



  FutureOr<void> _onCheckCodeEvent(
      CheckCodeEvent event, Emitter<AuthState> emit) async {
    emit(state.copyWith(checkCodeStatus: const BlocStatus.loading()));
    final result = await checkCodeUseCase(CheckCodeParams(
      AreaId: event.AreaId,
        Address: event.Address,
      DeviceToken: event.DeviceToken,
        Email: event.Email, FirstName: event.FirstName, Image: event.Image,LastName: event.LastName,Password: event.Password,PhoneNumber: event.PhoneNumber));
    switch (result) {
      case Success(value: final data):
        emit(state.copyWith(checkCodeStatus: const BlocStatus.success()));
        event.onSuccess();
      case Failure(exception: final exception, message: final message):
        emit(state.copyWith(checkCodeStatus: BlocStatus.fail(error: message)));
    }
  }

  FutureOr<void> _updateUserInfoEvent(
      UpdateUserInfoEvent event, Emitter<AuthState> emit) async {
    emit(state.copyWith(updateUserInfo: const BlocStatus.loading()));
    final result = await updateProfileUseCase(UpdateProfileParams(
        DeviceToken: event.DeviceToken,
        Email: event.Email,
        FirstName: event.FirstName,
        Image: event.Image,
        PhoneNumber: event.PhoneNumber,
        LastName: event.LastName,
        NewPassword: event.NewPassword,
        OldPassword: event.OldPassword,
        UserId: event.UserId,
    ));
    result.fold(
        (exception, message) => emit(
            state.copyWith(updateUserInfo: BlocStatus.fail(error: message))),
        (value) {
      emit(state.copyWith(updateUserInfo: const BlocStatus.success()));
      event.onSuccess();
    });
  }

 FutureOr<void> _onGetProfileEvent(
     GetProfileEvent event, Emitter<AuthState> emit) async {
    emit(state.copyWith(getUserInfo: const PageState.loading()));
    final result = await getProfileUseCase(getProfileParams(
        UserId: event.id??"",
    ));
    result.fold(
        (exception, message) => emit(
            state.copyWith(getUserInfo: PageState.error(exception: exception, message: message))),
        (value) {
      emit(state.copyWith(getUserInfo: PageState.loaded(data: value.data)));
      // event.onSuccess();
    });
  }

 FutureOr<void> _onAllAreaEvent(
     AllAreaEvent event, Emitter<AuthState> emit) async {
    emit(state.copyWith(listArea: const PageState.loading()));
    final result = await areaUseCase(NoParams());
    result.fold(
        (exception, message) => emit(
            state.copyWith(listArea: PageState.error(exception: exception, message: message))),
        (value) {
      emit(state.copyWith(listArea: PageState.loaded(data: value.data)));
      // event.onSuccess();
    });
  }

}

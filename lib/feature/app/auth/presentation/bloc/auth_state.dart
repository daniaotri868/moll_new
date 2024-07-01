part of 'auth_bloc.dart';

@immutable
class AuthState {
  final BlocStatus registerStatus;
  final BlocStatus checkCodeStatus;
  final BlocStatus updateUserInfo;
  final PageState<GetMyProfileModel> getUserInfo;
  final PageState<List<AllAreaModel>> listArea;
 final String codeVerification;
  final String countryCode;
  // final LatLng? addLocation;
  const AuthState(
      {
        this.codeVerification= '',
        this.registerStatus = const BlocStatus.initial(),
        this.checkCodeStatus = const BlocStatus.initial(),
        this.updateUserInfo=const BlocStatus.initial(),
        this.getUserInfo=const PageState.init(),
        this.listArea=const PageState.init(),
        this.countryCode='',
        // this.addLocation,
      });

  AuthState copyWith({
    final BlocStatus? registerStatus,
    final BlocStatus? checkCodeStatus,
    final BlocStatus? updateUserInfo,
    final PageState<GetMyProfileModel>? getUserInfo,
    final PageState<List<AllAreaModel>>? listArea,
    final String? codeVerification,
    final String? countryCode,
    // final LatLng? addLocation,
    final BlocStatus? locationUserDetailsStatus,


  }) {
    return AuthState(
        registerStatus: registerStatus ?? this.registerStatus,
        checkCodeStatus: checkCodeStatus ?? this.checkCodeStatus,
        updateUserInfo: updateUserInfo ?? this.updateUserInfo,
        codeVerification: codeVerification ??this.codeVerification,
       countryCode: countryCode??this.countryCode,
      // addLocation:  addLocation?? this.addLocation,
      getUserInfo: getUserInfo??this.getUserInfo,
      listArea: listArea??this.listArea

    );
  }
}

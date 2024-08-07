
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../../../../../common/constants/route.dart';
import '../../../../../common/models/response_wrapper/response_wrapper.dart';
import '../../../../../core/api/api_utils.dart';
import '../../../../../core/api/client.dart';
import '../../../../../core/api/client_config.dart';
import '../../domain/use_case/check_code_use_case.dart';
import '../../domain/use_case/update_profile_use_case.dart';
import '../../presentation/ui/screen/login_screen.dart';
import '../model/all_area.dart';
import '../model/auth_data_model.dart';
import '../model/calculateGeoLocationReverse.dart';
import '../model/profile_model.dart';

@injectable
class AuthRemoteDataSource {
  final ClientApi clientApi;

  AuthRemoteDataSource(this.clientApi);
  // final PreferencesRepository preference = getIt<PreferencesRepository>();
  Future<ResponseWrapper<String>> register(Map<String, dynamic> params) async {

    // if(params.CV!=null){
    return throwAppException(() async {
      final response = await clientApi.request(RequestConfig(
        endpoint: EndPoints.auth.login,
        data: params,
        clientMethod: ClientMethod.post,
      ));
      return ResponseWrapper.fromJson(
        {},
        (json) {
          LoginScreen.userId= response.data["userId"];
          return response.data['userId'];
        },
      );
    });
  }

  Future<ResponseWrapper<String>> checkCode(
      CheckCodeParams params) async {
    FormData formData = FormData.fromMap({
      'FirstName': params.FirstName,
      'LastName': params.LastName,
      'PhoneNumber': params.PhoneNumber,
      'Email':params.Email,
      'wallet':params.Wallet,
      'Password':params.Password,
      'Address':params.Address,
      'AreaId':params.AreaId,
      // 'Image':Image,
      'DeviceToken':params.DeviceToken,
    });
    // if(params.CV!=null){
    // formData.files.add(MapEntry('Image', await MultipartFile.fromFile("")));
    return throwAppException(() async {
      final response = await clientApi.request(RequestConfig(
        endpoint: EndPoints.auth.sign,
        data: formData,
        clientMethod: ClientMethod.post,
      ));
      return ResponseWrapper.fromJson(
        response.data,
        (json) {
          LoginScreen.userId= response.data["userId"];
          // preference.setString(PreferencesKeys.status, response.data['status']);
          // preference.setString(PreferencesKeys.token, response.data['token']);
          // preference.setString(
          //     PreferencesKeys.refreshToken, response.data['refreshToken']);
          return response.data["userId"];
        },
      );
    });
  }


  Future<ResponseWrapper<bool>> updateProfile(
      UpdateProfileParams params) async {
    FormData formData = FormData.fromMap({
      'FirstName': params.FirstName,
      'LastName': params.LastName,
      'PhoneNumber': params.PhoneNumber,
      'Email':params.Email,
      'OldPassword':params.PhoneNumber,
      // 'Image':Image,
      'DeviceToken':params.DeviceToken,
      'UserId':params.UserId,
      'NewPassword':params.NewPassword,
      'Wallet':params.wallet
    });
    // if(params.CV!=null){
    // formData.files.add(MapEntry('Image', await MultipartFile.fromFile("")));
    return throwAppException(() async {
      final response = await clientApi.request(RequestConfig(
        endpoint: EndPoints.auth.updateUserInfo,
        data: formData,
        clientMethod: ClientMethod.post,
      ));
      return ResponseWrapper.fromJson(
        {},
        (json) {
          return true;
        },
      );
    });
  }

  Future<ResponseWrapper<GetMyProfileModel>> getProfile(
      Map<String, dynamic> params) async {
    return throwAppException(() async {
      final response = await clientApi.request(RequestConfig(
        endpoint: EndPoints.profile.getUserInfo,
        queryParameters: params,
        clientMethod: ClientMethod.get,
      ));
      return ResponseWrapper.fromJson(
        {},
        (json) {
          return GetMyProfileModel.fromJson(response.data);
        },
      );
    });
  }

Future<ResponseWrapper<List<AllAreaModel>>> getAllArea(
      Map<String, dynamic> params) async {
    return throwAppException(() async {
      final response = await clientApi.request(RequestConfig(
        endpoint: EndPoints.auth.area,
        data: params,
        clientMethod: ClientMethod.get,
      ));
      return ResponseWrapper.fromJson(
        {},
        (json) {
          var data = (response.data==null)?[]:(response.data as List);
          List<AllAreaModel> allPromo =
          data.map((e) => AllAreaModel.fromJson(e)).toList();
          return allPromo;
        },
      );
    });
  }


}

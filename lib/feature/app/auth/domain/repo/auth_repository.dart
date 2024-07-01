

import '../../../../../common/models/response_wrapper/response_wrapper.dart';
import '../../../../../core/api/result.dart';
import '../../data/model/all_area.dart';
import '../../data/model/auth_data_model.dart';
import '../../data/model/calculateGeoLocationReverse.dart';
import '../../data/model/profile_model.dart';


abstract class AuthRepository {
  Future<Result<ResponseWrapper<String>>> registerRepo(Map<String, dynamic> params);
  Future<Result<ResponseWrapper<String>>> checkCode(Map<String, dynamic> params);
  Future<Result<ResponseWrapper<List<AllAreaModel>>>> getAllArea(Map<String, dynamic> params);
  Future<Result<ResponseWrapper<bool>>> updateProfile(Map<String, dynamic> params);
  Future<Result<ResponseWrapper<GetMyProfileModel>>> getProfile(Map<String, dynamic> params);

}

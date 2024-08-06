

import '../../../../../common/models/response_wrapper/response_wrapper.dart';
import '../../../../../core/api/result.dart';
import '../../data/model/all_area.dart';
import '../../data/model/auth_data_model.dart';
import '../../data/model/calculateGeoLocationReverse.dart';
import '../../data/model/profile_model.dart';
import '../use_case/check_code_use_case.dart';
import '../use_case/update_profile_use_case.dart';


abstract class AuthRepository {
  Future<Result<ResponseWrapper<String>>> registerRepo(Map<String, dynamic> params);
  Future<Result<ResponseWrapper<String>>> checkCode(CheckCodeParams params);
  Future<Result<ResponseWrapper<List<AllAreaModel>>>> getAllArea(Map<String, dynamic> params);
  Future<Result<ResponseWrapper<bool>>> updateProfile(UpdateProfileParams params);
  Future<Result<ResponseWrapper<GetMyProfileModel>>> getProfile(Map<String, dynamic> params);

}

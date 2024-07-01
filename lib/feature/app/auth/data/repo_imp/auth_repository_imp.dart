
import 'package:injectable/injectable.dart';
import '../../../../../common/models/response_wrapper/response_wrapper.dart';
import '../../../../../core/api/api_utils.dart';
import '../../../../../core/api/result.dart';
import '../../domain/repo/auth_repository.dart';
import '../data_source/auth_remot_data_source.dart';
import '../model/all_area.dart';
import '../model/auth_data_model.dart';
import '../model/calculateGeoLocationReverse.dart';
import '../model/profile_model.dart';



@Injectable(as: AuthRepository)
class AuthRepositoryImpl extends AuthRepository {
  final AuthRemoteDataSource datasource;

  AuthRepositoryImpl({required this.datasource});

  @override
  Future<Result<ResponseWrapper<String>>> checkCode(Map<String, dynamic> params) {
    return toApiResult(() async {
      final result = datasource.checkCode(params);
      return result;
    });
  }

  @override
  Future<Result<ResponseWrapper<List<AllAreaModel>>>> getAllArea(Map<String, dynamic> params) {
    return toApiResult(() async {
      final result = datasource.getAllArea(params);
      return result;
    });
  }

  @override
  Future<Result<ResponseWrapper<String>>> registerRepo(Map<String, dynamic> params) {
    return toApiResult(() async {
      final result = datasource.register(params);
      return result;
    });
  }

  @override
  Future<Result<ResponseWrapper<bool>>> updateProfile(Map<String, dynamic> params) {
    return toApiResult(() async {
      final result = datasource.updateProfile(params);
      return result;
    });
  }


 @override
  Future<Result<ResponseWrapper<GetMyProfileModel>>> getProfile(Map<String, dynamic> params) {
    return toApiResult(() async {
      final result = datasource.getProfile(params);
      return result;
    });
  }





}

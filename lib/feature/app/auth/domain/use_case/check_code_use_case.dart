import 'package:injectable/injectable.dart';

import '../../../../../common/models/response_wrapper/response_wrapper.dart';
import '../../../../../core/api/result.dart';
import '../../../../../core/use_case/use_case.dart';
import '../../data/model/auth_data_model.dart';
import '../repo/auth_repository.dart';

@injectable
class CheckCodeUseCase
    extends UseCase<Result<ResponseWrapper<String>>, CheckCodeParams> {
  CheckCodeUseCase(this.repository);

  final AuthRepository repository;

  @override
  Future<Result<ResponseWrapper<String>>> call(CheckCodeParams params) {
    return repository.checkCode(params);
  }
}

class CheckCodeParams {
  final String FirstName;
  final double Wallet;
  final String LastName;
  final String PhoneNumber;
  final String Image;
  final String Password;
final String Email;
final String DeviceToken;
  final String Address;
  final String AreaId;
  CheckCodeParams(
      {  required this.AreaId,required this.Wallet,
        required this.Address,required this.FirstName,required this.DeviceToken,required this.Image, required this.LastName, required this.PhoneNumber,required this.Email,required this.Password});

  Map<String, dynamic> toMap() {
    return {
      'FirstName': FirstName,
      'LastName': LastName,
      'PhoneNumber': PhoneNumber,
      'Email':Email,
      'wallet':Wallet,
      'Password':Password,
      'Address':Address,
      'AreaId':AreaId,
      // 'Image':Image,
      'DeviceToken':DeviceToken,
    };
  }
}

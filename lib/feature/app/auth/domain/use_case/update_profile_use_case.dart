
import 'package:injectable/injectable.dart';

import '../../../../../common/models/response_wrapper/response_wrapper.dart';
import '../../../../../core/api/result.dart';
import '../../../../../core/use_case/use_case.dart';
import '../repo/auth_repository.dart';


@injectable
class UpdateProfileUseCase extends UseCase<Result<ResponseWrapper<bool>>, UpdateProfileParams> {
  UpdateProfileUseCase(this.repository);

  final AuthRepository repository;

  @override
  Future<Result<ResponseWrapper<bool>>> call(UpdateProfileParams params) {
    return repository.updateProfile(params);
  }
}

class UpdateProfileParams {
  final String FirstName;
  final String LastName;
  final String PhoneNumber;
  final String Image;
  final String OldPassword;
  final String Email;
  final String DeviceToken;
  final String UserId;
  final double wallet;
  final String NewPassword;
  UpdateProfileParams({
    required this.FirstName,required this.wallet,required this.NewPassword,required this.UserId,
    required this.DeviceToken,required this.Image, required this.LastName,
    required this.PhoneNumber,required this.Email,required this.OldPassword
  });

  Map<String, dynamic> toMap() {
    return {
      'FirstName': FirstName,
      'LastName': LastName,
      'PhoneNumber': PhoneNumber,
      'Email':Email,
      'OldPassword':OldPassword,
      // 'Image':Image,
      'DeviceToken':DeviceToken,
      'UserId':UserId,
      'NewPassword':NewPassword,
    };
  }
}

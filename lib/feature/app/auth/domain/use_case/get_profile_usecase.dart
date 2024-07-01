
import 'package:injectable/injectable.dart';

import '../../../../../common/models/response_wrapper/response_wrapper.dart';
import '../../../../../core/api/result.dart';
import '../../../../../core/use_case/use_case.dart';
import '../../data/model/profile_model.dart';
import '../repo/auth_repository.dart';


@injectable
class GetProfileUseCase extends UseCase<Result<ResponseWrapper<GetMyProfileModel>>, getProfileParams> {
  GetProfileUseCase(this.repository);

  final AuthRepository repository;

  @override
  Future<Result<ResponseWrapper<GetMyProfileModel>>> call(getProfileParams params) {
    return repository.getProfile(params.toMap());
  }
}

class getProfileParams {

  final String UserId;
  getProfileParams({
    required this.UserId,
  });

  Map<String, dynamic> toMap() {
    return {
      'UserId':UserId,
    };
  }
}

import 'package:injectable/injectable.dart';
import '../../../../../common/models/response_wrapper/response_wrapper.dart';
import '../../../../../core/api/result.dart';
import '../../../../../core/use_case/use_case.dart';
import '../repo/auth_repository.dart';


@injectable
class RegisterUseCase extends UseCase<Result<ResponseWrapper<String>>, RegisterParams> {
  RegisterUseCase(this.repository);

  final AuthRepository repository;

  @override
  Future<Result<ResponseWrapper<String>>> call(RegisterParams params) {
    return repository.registerRepo(params.toMap());
  }
}

class RegisterParams {
  final String email;
  final String password;

  RegisterParams({
    required this.email,
    required this.password,
  });

  Map<String, dynamic> toMap() {
    return {
      'email': email,
      'password':password
    };
  }
}

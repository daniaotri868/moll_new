import 'package:injectable/injectable.dart';
import '../../../../../common/models/response_wrapper/response_wrapper.dart';
import '../../../../../core/api/result.dart';
import '../../../../../core/use_case/use_case.dart';
import '../../data/model/department_details_model.dart';
import '../repo/home_repository.dart';


@injectable
class ChangeFavUseCase extends UseCase<Result<ResponseWrapper<bool>>, ChangeFavParams> {
  ChangeFavUseCase(this.repository);

  final HomeRepository repository;

  @override
  Future<Result<ResponseWrapper<bool>>> call(ChangeFavParams params) {
    return repository.changeFav(params.toMap());
  }
}

class ChangeFavParams {
  final String userId;
  final String id;

  ChangeFavParams({
    required this.userId,
    required this.id,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'userId':userId
    };
  }
}

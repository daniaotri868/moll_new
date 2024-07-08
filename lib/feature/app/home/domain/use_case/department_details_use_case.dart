import 'package:injectable/injectable.dart';
import '../../../../../common/models/response_wrapper/response_wrapper.dart';
import '../../../../../core/api/result.dart';
import '../../../../../core/use_case/use_case.dart';
import '../../data/model/department_details_model.dart';
import '../repo/home_repository.dart';


@injectable
class DepartmentDetailsUseCase extends UseCase<Result<ResponseWrapper<GetAllDepartmentDetailsModel>>, DetailsParams> {
  DepartmentDetailsUseCase(this.repository);

  final HomeRepository repository;

  @override
  Future<Result<ResponseWrapper<GetAllDepartmentDetailsModel>>> call(DetailsParams params) {
    return repository.getDepartmentDetails(params.toMap());
  }
}

class DetailsParams {
  final String userId;
  final String id;
  final String ?search;

  DetailsParams({
    required this.userId,
    required this.id,
     this.search,
  });

  Map<String, dynamic> toMap() {
    return {
      'Id': id,
      'UserId':userId,
      'Name':search
    };
  }
}

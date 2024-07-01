
import 'package:injectable/injectable.dart';

import '../../../../../common/models/response_wrapper/response_wrapper.dart';
import '../../../../../core/api/result.dart';
import '../../../../../core/use_case/use_case.dart';
import '../../data/model/all_department_model.dart';
import '../repo/home_repository.dart';
import 'department_details_use_case.dart';


@injectable
class GetAllDepartmentUseCase extends UseCase<Result<ResponseWrapper<GetAllDepartmentModel>>, DetailsParams> {
  GetAllDepartmentUseCase(this.repository);

  final HomeRepository repository;

  @override
  Future<Result<ResponseWrapper<GetAllDepartmentModel>>> call(DetailsParams params) {
    return repository.getAllDepartment(params.toMap());
  }
}



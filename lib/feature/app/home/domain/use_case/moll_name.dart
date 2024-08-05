
import 'package:injectable/injectable.dart';

import '../../../../../common/models/response_wrapper/response_wrapper.dart';
import '../../../../../core/api/result.dart';
import '../../../../../core/use_case/use_case.dart';
import '../../data/model/department_product.dart';
import '../../data/model/moll_model.dart';
import '../../data/model/moll_name.dart';
import '../repo/home_repository.dart';
import 'department_details_use_case.dart';

@injectable
class MollNameUseCase
    extends UseCase<Result<ResponseWrapper<List<AllMollNameModel>>>, DetailsParams> {
  MollNameUseCase(this.repository);

  final HomeRepository repository;

  @override
  Future<Result<ResponseWrapper<List<AllMollNameModel>>>> call(DetailsParams params) {
    return repository.mollname(params.toMap());
  }
}


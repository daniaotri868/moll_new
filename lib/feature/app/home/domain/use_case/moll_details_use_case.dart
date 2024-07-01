
import 'package:injectable/injectable.dart';

import '../../../../../common/models/response_wrapper/response_wrapper.dart';
import '../../../../../core/api/result.dart';
import '../../../../../core/use_case/use_case.dart';
import '../../data/model/moll_details.dart';
import '../repo/home_repository.dart';
import 'department_details_use_case.dart';


@injectable
class GetMollDetailsUseCase extends UseCase<Result<ResponseWrapper<GetMollDetailsModel>>, DetailsParams> {
  GetMollDetailsUseCase(this.repository);

  final HomeRepository repository;

  @override
  Future<Result<ResponseWrapper<GetMollDetailsModel>>> call(DetailsParams params) {
    return repository.getMallDetails(params.toMap());
  }
}



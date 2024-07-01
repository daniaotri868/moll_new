import 'package:injectable/injectable.dart';

import '../../../../../common/models/response_wrapper/response_wrapper.dart';
import '../../../../../core/api/result.dart';
import '../../../../../core/use_case/use_case.dart';
import '../../data/model/all_area.dart';
import '../../data/model/auth_data_model.dart';
import '../repo/auth_repository.dart';

@injectable
class AreaUseCase
    extends UseCase<Result<ResponseWrapper<List<AllAreaModel>>>, NoParams> {
  AreaUseCase(this.repository);

  final AuthRepository repository;

  @override
  Future<Result<ResponseWrapper<List<AllAreaModel>>>> call(NoParams params) {
    return repository.getAllArea({});
  }
}


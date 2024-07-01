
import 'package:injectable/injectable.dart';

import '../../../../../common/models/response_wrapper/response_wrapper.dart';
import '../../../../../core/api/result.dart';
import '../../../../../core/use_case/use_case.dart';
import '../../data/model/moll_details.dart';
import '../../data/model/product_details_model.dart';
import '../repo/home_repository.dart';
import 'department_details_use_case.dart';


@injectable
class GetProductDetailsUseCase extends UseCase<Result<ResponseWrapper<GetProductDetailsModel>>, DetailsParams> {
  GetProductDetailsUseCase(this.repository);

  final HomeRepository repository;

  @override
  Future<Result<ResponseWrapper<GetProductDetailsModel>>> call(DetailsParams params) {
    return repository.getProductDetails(params.toMap());
  }
}


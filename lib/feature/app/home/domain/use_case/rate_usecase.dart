
import 'package:injectable/injectable.dart';

import '../../../../../common/models/response_wrapper/response_wrapper.dart';
import '../../../../../core/api/result.dart';
import '../../../../../core/use_case/use_case.dart';
import '../../data/model/moll_details.dart';
import '../../data/model/order_details_model.dart';
import '../../data/model/product_details_model.dart';
import '../repo/home_repository.dart';
import 'department_details_use_case.dart';


@injectable
class RateOrdersUseCase extends UseCase<Result<ResponseWrapper<bool>>, RateOrderParams> {
  RateOrdersUseCase(this.repository);

  final HomeRepository repository;

  @override
  Future<Result<ResponseWrapper<bool>>> call(RateOrderParams params) {
    return repository.rateOrder(params.toMap());
  }
}

class RateOrderParams {
  final String userId;
  final String id;
  final String ?note;

  RateOrderParams({
    required this.userId,
    required this.id,
    this.note,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'userId':userId,
      'note':note,
    };
  }
}


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
class NewRateOrdersUseCase extends UseCase<Result<ResponseWrapper<bool>>, NewRateOrderParams> {
  NewRateOrdersUseCase(this.repository);

  final HomeRepository repository;

  @override
  Future<Result<ResponseWrapper<bool>>> call(NewRateOrderParams params) {
    return repository.newRateOrder(params.toMap());
  }
}

class NewRateOrderParams {
  final String userId;
  final String id;
  final String ?reason;
  final double ?rateOrder;
  final double ?rateDriver;
  final String ?reasonOrder;

  NewRateOrderParams({
    required this.userId,
    required this.id,
    this.reason,
    this.rateOrder,
    this.rateDriver,
    this.reasonOrder,
  });

  Map<String, dynamic> toMap() {
    return {
      "userId":userId,
      "id": id,
      "orderEvaluationNote": reason,
      "orderEvaluation": rateOrder,
      "driverEvaluation":rateDriver,
      "driverEvaluationNote":reasonOrder
    };
  }
}


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
class CancelOrdersUseCase extends UseCase<Result<ResponseWrapper<bool>>, CancelOrderParams> {
  CancelOrdersUseCase(this.repository);

  final HomeRepository repository;

  @override
  Future<Result<ResponseWrapper<bool>>> call(CancelOrderParams params) {
    return repository.cancelOrder(params.toMap());
  }
}

class CancelOrderParams {
  final String userId;
  final String id;
  final String ?reason;

  CancelOrderParams({
    required this.userId,
    required this.id,
    this.reason,
  });

  Map<String, dynamic> toMap() {
    return {
      "userId":userId,
      "id": id,
      "reason": reason
    };
  }
}

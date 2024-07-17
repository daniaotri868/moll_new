
import 'package:injectable/injectable.dart';

import '../../../../../common/models/response_wrapper/response_wrapper.dart';
import '../../../../../core/api/result.dart';
import '../../../../../core/use_case/use_case.dart';
import '../../data/model/all_order_model.dart';
import '../../data/model/moll_details.dart';
import '../../data/model/product_details_model.dart';
import '../repo/home_repository.dart';
import 'department_details_use_case.dart';


@injectable
class GetOrdersUseCase extends UseCase<Result<ResponseWrapper<List<AllOrderModel>>>, GetOrderParams> {
  GetOrdersUseCase(this.repository);

  final HomeRepository repository;

  @override
  Future<Result<ResponseWrapper<List<AllOrderModel>>>> call(GetOrderParams params) {
    return repository.getOrders(params.toMap());
  }
}

class GetOrderParams {
  final String userId;
  final String ?type;

  GetOrderParams({
    required this.userId,
    this.type,
  });

  Map<String, dynamic> toMap() {
    return {
      'UserId':userId,
      'Type':type
    };
  }
}

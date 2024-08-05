
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
class OrderDetailsUseCase extends UseCase<Result<ResponseWrapper<OrderDetailsModel>>, OrderDetailsParams> {
  OrderDetailsUseCase(this.repository);

  final HomeRepository repository;

  @override
  Future<Result<ResponseWrapper<OrderDetailsModel>>> call(OrderDetailsParams params) {
    return repository.orderDetails(params.toMap());
  }
}

class OrderDetailsParams {
  final String userId;
  final String id;
  final String ?search;
  final bool ?cancel;

  OrderDetailsParams({
    required this.userId,
    required this.id,
    this.search,
    this.cancel,
  });

  Map<String, dynamic> toMap() {
    return {
      'Id': id,
      'UserId':userId,

    };
  }
}

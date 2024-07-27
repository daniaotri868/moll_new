
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
class UpdateOrdersUseCase extends UseCase<Result<ResponseWrapper<OrderDetailsModel>>, UpdateOrderParams> {
  UpdateOrdersUseCase(this.repository);

  final HomeRepository repository;

  @override
  Future<Result<ResponseWrapper<OrderDetailsModel>>> call(UpdateOrderParams params) {
    return repository.updateOrder(params.toMap());
  }
}

class UpdateOrderParams {
  final String userId;
  final String address;
  final String ?areaId;
  final String ?id;
  final double ?lat;
  final double ?lng;
  final List<Map> ?products;

  UpdateOrderParams({
    required this.userId,
    required this.address,
    this.areaId,
    this.id,
    this.lng,
    this.lat,
    this.products,
  });

  Map<String, dynamic> toMap() {
    return {
      'address': address,
      'userId':userId,
      'areaId':areaId,
      'products':products,
      'id':id,
      'lat':lat,
      'lng':lng,

    };
  }
}

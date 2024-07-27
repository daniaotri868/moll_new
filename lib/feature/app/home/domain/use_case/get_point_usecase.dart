
import 'package:injectable/injectable.dart';

import '../../../../../common/models/response_wrapper/response_wrapper.dart';
import '../../../../../core/api/result.dart';
import '../../../../../core/use_case/use_case.dart';
import '../../data/model/all_order_model.dart';
import '../../data/model/moll_details.dart';
import '../../data/model/point_model.dart';
import '../../data/model/product_details_model.dart';
import '../repo/home_repository.dart';
import 'department_details_use_case.dart';


@injectable
class MyPointsUseCase extends UseCase<Result<ResponseWrapper<List<MyPointsModel>>>, MyPointParams> {
  MyPointsUseCase(this.repository);

  final HomeRepository repository;

  @override
  Future<Result<ResponseWrapper<List<MyPointsModel>>>> call(MyPointParams params) {
    return repository.getMyPoints(params.toMap());
  }
}

class MyPointParams {
  final String userId;
  // final String ?type;

  MyPointParams({
    required this.userId,
    // this.type,
  });

  Map<String, dynamic> toMap() {
    return {
      'UserId':userId,
      // 'Type':type
    };
  }
}

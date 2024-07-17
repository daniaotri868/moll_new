
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
class ConfirmOrdersUseCase extends UseCase<Result<ResponseWrapper<bool>>, ConfirmOrderParams> {
  ConfirmOrdersUseCase(this.repository);

  final HomeRepository repository;

  @override
  Future<Result<ResponseWrapper<bool>>> call(ConfirmOrderParams params) {
    return repository.confirmOrder(params.toMap());
  }
}

class ConfirmOrderParams {
  final String userId;
  final String id;
  final String ?note;

  ConfirmOrderParams({
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

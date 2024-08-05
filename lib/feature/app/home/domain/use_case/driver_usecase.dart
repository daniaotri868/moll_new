
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
class DriverUseCase extends UseCase<Result<ResponseWrapper<bool>>, DriverParams> {
  DriverUseCase(this.repository);

  final HomeRepository repository;

  @override
  Future<Result<ResponseWrapper<bool>>> call(DriverParams params) {
    return repository.driver(params);
  }
}

class DriverParams {
  final String FirstName;
  final String LastName;
  final String ?MallId;
  final String ?Email;
  final String ?PhoneNumber;
  final String ?CV;

  DriverParams({
    required this.FirstName,
    required this.LastName,
    this.MallId,
    this.Email,
    this.PhoneNumber,
    this.CV,
  });

  Map<String, dynamic> toMap() {
    return {
      "Email":Email,
      "LastName":LastName,
      "FirstName":FirstName,
      "MallId":MallId,
      "PhoneNumber": PhoneNumber,
      "CV": CV
    };
  }
}

import 'package:injectable/injectable.dart';

import '../../../../../common/models/response_wrapper/response_wrapper.dart';
import '../../../../../core/api/result.dart';
import '../../../../../core/use_case/use_case.dart';
import '../../data/model/moll_model.dart';
import '../repo/home_repository.dart';

@injectable
class GetAllMollUseCase
    extends UseCase<Result<ResponseWrapper<GetMollModel>>, MollParams> {
  GetAllMollUseCase(this.repository);

  final HomeRepository repository;

  @override
  Future<Result<ResponseWrapper<GetMollModel>>> call(MollParams params) {
    return repository.getMall(params.toMap());
  }
}

class MollParams {
  final String UserId;
  final String name;

  MollParams(
      {required this.UserId,required this.name});

  Map<String, dynamic> toMap() {
    return {
      'UserId': UserId,
      'name': name,

    };
  }
}

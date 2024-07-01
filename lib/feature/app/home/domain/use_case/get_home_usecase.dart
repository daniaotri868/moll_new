import 'package:injectable/injectable.dart';

import '../../../../../common/models/response_wrapper/response_wrapper.dart';
import '../../../../../core/api/result.dart';
import '../../../../../core/use_case/use_case.dart';
import '../../data/model/home_model.dart';
import '../../data/model/moll_model.dart';
import '../repo/home_repository.dart';

@injectable
class GetHomeUseCase
    extends UseCase<Result<ResponseWrapper<HomeModel>>, HomeParams> {
  GetHomeUseCase(this.repository);

  final HomeRepository repository;

  @override
  Future<Result<ResponseWrapper<HomeModel>>> call(HomeParams params) {
    return repository.getHome(params.toMap());
  }
}

class HomeParams {
  final String UserId;

  HomeParams(
      {required this.UserId});

  Map<String, dynamic> toMap() {
    return {
      'UserId': UserId,

    };
  }
}

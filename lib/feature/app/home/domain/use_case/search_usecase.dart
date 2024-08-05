import 'package:injectable/injectable.dart';
import '../../../../../common/models/response_wrapper/response_wrapper.dart';
import '../../../../../core/api/result.dart';
import '../../../../../core/use_case/use_case.dart';
import '../../data/model/department_details_model.dart';
import '../../data/model/search_model.dart';
import '../repo/home_repository.dart';


@injectable
class SearchHomeUseCase extends UseCase<Result<ResponseWrapper<SearchHomeModel>>, SearchParams> {
  SearchHomeUseCase(this.repository);

  final HomeRepository repository;

  @override
  Future<Result<ResponseWrapper<SearchHomeModel>>> call(SearchParams params) {
    return repository.searchHome(params.toMap());
  }
}

class SearchParams {
  final String userId;
  final String ?search;

  SearchParams({
    required this.userId,

    this.search,
  });

  Map<String, dynamic> toMap() {
    return {
      'UserId':userId,
      'Search':search
    };
  }
}

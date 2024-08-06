import 'package:injectable/injectable.dart';
import '../../../../../common/models/response_wrapper/response_wrapper.dart';
import '../../../../../core/api/result.dart';
import '../../../../../core/use_case/use_case.dart';
import '../../data/model/notifications_model.dart';
import '../repo/home_repository.dart';


@injectable
class NotificationsUseCase implements UseCase<Result<ResponseWrapper<List<NotificationsModel>>>, NotificationsParam>  {
  final HomeRepository repository;

NotificationsUseCase({required this.repository});

@override
Future<Result<ResponseWrapper<List<NotificationsModel>>>> call(NotificationsParam params) async {
return repository.notifications(params.toMap());
}
}


class NotificationsParam{
  final String userId;
  NotificationsParam({required this.userId});

  Map<String, dynamic> toMap() {
    return {
      'UserId': userId,

    };
  }
}
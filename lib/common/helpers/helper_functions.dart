import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import '../../feature/app/domin/repositories/prefs_repository.dart';


class HelperFunctions {
  HelperFunctions._singleton();

  static HelperFunctions? _instance;

  factory HelperFunctions() {
    return instance;
  }

  static HelperFunctions get instance =>
      _instance ??= HelperFunctions._singleton();


  Future<void> logout() async {
    await GetIt.I.resetLazySingleton<Dio>();
    await GetIt.I<PrefsRepository>().clearUser();
    return;
  }

}


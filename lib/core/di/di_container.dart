import 'dart:async';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../common/constants/route.dart';
import '../api/log_interceptor.dart';
import 'di_container.config.dart';

final GetIt getIt = GetIt.I;

@InjectableInit(
  initializerName: r'$initGetIt',
  preferRelativeImports: true,
  asExtension: false,
)
Future<GetIt> configureDependencies() async => $initGetIt(getIt);

@module
abstract class AppModule {

  BaseOptions get dioOption => BaseOptions(
    baseUrl: EndPoints.baseUrl,
    connectTimeout: const Duration(seconds: 20),
    receiveTimeout: const Duration(seconds: 20),
    headers: <String, String>{
      HttpHeaders.acceptHeader: 'application/json',
    },
  );

  @singleton
  Logger get logger => Logger();

  @lazySingleton
  Dio dio(BaseOptions option, Logger logger) {
    final dio = Dio(option);
    dio.interceptors.addAll([
      LoggerInterceptor(),
    ]);
    return dio;
  }

  @preResolve
  @singleton
  Future<SharedPreferences> get sharedPreferences => SharedPreferences.getInstance();

}

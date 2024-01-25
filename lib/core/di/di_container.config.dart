// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i4;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:logger/logger.dart' as _i5;
import 'package:shared_preferences/shared_preferences.dart' as _i6;

import '../../feature/app/data/repository/prefs_repository_impl.dart' as _i8;
import '../../feature/app/domin/repositories/prefs_repository.dart' as _i7;
import '../../feature/app/presentation/bloc/app_manager_cubit.dart' as _i3;
import '../api/client.dart' as _i9;
import 'di_container.dart' as _i10;

// initializes the registration of main-scope dependencies inside of GetIt
Future<_i1.GetIt> $initGetIt(
  _i1.GetIt getIt, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) async {
  final gh = _i2.GetItHelper(
    getIt,
    environment,
    environmentFilter,
  );
  final appModule = _$AppModule();
  gh.lazySingleton<_i3.AppManagerCubit>(() => _i3.AppManagerCubit());
  gh.factory<_i4.BaseOptions>(() => appModule.dioOption);
  gh.singleton<_i5.Logger>(appModule.logger);
  await gh.singletonAsync<_i6.SharedPreferences>(
    () => appModule.sharedPreferences,
    preResolve: true,
  );
  gh.lazySingleton<_i4.Dio>(() => appModule.dio(
        gh<_i4.BaseOptions>(),
        gh<_i5.Logger>(),
      ));
  gh.factory<_i7.PrefsRepository>(
      () => _i8.PrefsRepositoryImpl(gh<_i6.SharedPreferences>()));
  gh.factory<_i9.ClientApi>(() => _i9.ClientApi(gh<_i4.Dio>()));
  return getIt;
}

class _$AppModule extends _i10.AppModule {}

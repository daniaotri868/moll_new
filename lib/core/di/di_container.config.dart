// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i3;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:logger/logger.dart' as _i4;
import 'package:shared_preferences/shared_preferences.dart' as _i5;

import '../../feature/app/auth/data/data_source/auth_remot_data_source.dart'
    as _i10;
import '../../feature/app/auth/data/repo_imp/auth_repository_imp.dart' as _i13;
import '../../feature/app/auth/domain/repo/auth_repository.dart' as _i12;
import '../../feature/app/auth/domain/use_case/area_usecase.dart' as _i18;
import '../../feature/app/auth/domain/use_case/check_code_use_case.dart'
    as _i14;
import '../../feature/app/auth/domain/use_case/get_profile_usecase.dart'
    as _i15;
import '../../feature/app/auth/domain/use_case/register_use_case.dart' as _i16;
import '../../feature/app/auth/domain/use_case/update_profile_use_case.dart'
    as _i17;
import '../../feature/app/auth/presentation/bloc/auth_bloc.dart' as _i21;
import '../../feature/app/data/repository/prefs_repository_impl.dart' as _i8;
import '../../feature/app/domin/repositories/prefs_repository.dart' as _i7;
import '../../feature/app/home/data/data_source/home_remot_data_source.dart'
    as _i11;
import '../../feature/app/home/data/repo_imp/auth_repository_imp.dart' as _i20;
import '../../feature/app/home/domain/repo/home_repository.dart' as _i19;
import '../../feature/app/home/domain/use_case/change_fav_usecase.dart' as _i30;
import '../../feature/app/home/domain/use_case/department_details_use_case.dart'
    as _i22;
import '../../feature/app/home/domain/use_case/department_usecase.dart' as _i23;
import '../../feature/app/home/domain/use_case/get_all_fav_usecase.dart'
    as _i24;
import '../../feature/app/home/domain/use_case/get_department_product.dart'
    as _i25;
import '../../feature/app/home/domain/use_case/get_home_usecase.dart' as _i26;
import '../../feature/app/home/domain/use_case/get_product_details_usecase.dart'
    as _i27;
import '../../feature/app/home/domain/use_case/moll_details_use_case.dart'
    as _i28;
import '../../feature/app/home/domain/use_case/moll_use_case.dart' as _i29;
import '../../feature/app/home/presentation/bloc/auth_bloc.dart' as _i31;
import '../../feature/app/presentation/bloc/app_manager_cubit.dart' as _i6;
import '../api/client.dart' as _i9;
import 'di_container.dart' as _i32;

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
  gh.factory<_i3.BaseOptions>(() => appModule.dioOption);
  gh.singleton<_i4.Logger>(() => appModule.logger);
  await gh.singletonAsync<_i5.SharedPreferences>(
    () => appModule.sharedPreferences,
    preResolve: true,
  );
  gh.lazySingleton<_i6.AppManagerCubit>(() => _i6.AppManagerCubit());
  gh.lazySingleton<_i3.Dio>(() => appModule.dio(
        gh<_i3.BaseOptions>(),
        gh<_i4.Logger>(),
      ));
  gh.factory<_i7.PrefsRepository>(
      () => _i8.PrefsRepositoryImpl(gh<_i5.SharedPreferences>()));
  gh.factory<_i9.ClientApi>(() => _i9.ClientApi(gh<_i3.Dio>()));
  gh.factory<_i10.AuthRemoteDataSource>(
      () => _i10.AuthRemoteDataSource(gh<_i9.ClientApi>()));
  gh.factory<_i11.HomeRemoteDataSource>(
      () => _i11.HomeRemoteDataSource(gh<_i9.ClientApi>()));
  gh.factory<_i12.AuthRepository>(() =>
      _i13.AuthRepositoryImpl(datasource: gh<_i10.AuthRemoteDataSource>()));
  gh.factory<_i14.CheckCodeUseCase>(
      () => _i14.CheckCodeUseCase(gh<_i12.AuthRepository>()));
  gh.factory<_i15.GetProfileUseCase>(
      () => _i15.GetProfileUseCase(gh<_i12.AuthRepository>()));
  gh.factory<_i16.RegisterUseCase>(
      () => _i16.RegisterUseCase(gh<_i12.AuthRepository>()));
  gh.factory<_i17.UpdateProfileUseCase>(
      () => _i17.UpdateProfileUseCase(gh<_i12.AuthRepository>()));
  gh.factory<_i18.AreaUseCase>(
      () => _i18.AreaUseCase(gh<_i12.AuthRepository>()));
  gh.factory<_i19.HomeRepository>(() =>
      _i20.AuthRepositoryImpl(datasource: gh<_i11.HomeRemoteDataSource>()));
  gh.factory<_i21.AuthBloc>(() => _i21.AuthBloc(
        gh<_i16.RegisterUseCase>(),
        gh<_i14.CheckCodeUseCase>(),
        gh<_i17.UpdateProfileUseCase>(),
        gh<_i15.GetProfileUseCase>(),
        gh<_i18.AreaUseCase>(),
      ));
  gh.factory<_i22.DepartmentDetailsUseCase>(
      () => _i22.DepartmentDetailsUseCase(gh<_i19.HomeRepository>()));
  gh.factory<_i23.GetAllDepartmentUseCase>(
      () => _i23.GetAllDepartmentUseCase(gh<_i19.HomeRepository>()));
  gh.factory<_i24.GetFavProductUseCase>(
      () => _i24.GetFavProductUseCase(gh<_i19.HomeRepository>()));
  gh.factory<_i25.GetDepartmentProductUseCase>(
      () => _i25.GetDepartmentProductUseCase(gh<_i19.HomeRepository>()));
  gh.factory<_i26.GetHomeUseCase>(
      () => _i26.GetHomeUseCase(gh<_i19.HomeRepository>()));
  gh.factory<_i27.GetProductDetailsUseCase>(
      () => _i27.GetProductDetailsUseCase(gh<_i19.HomeRepository>()));
  gh.factory<_i28.GetMollDetailsUseCase>(
      () => _i28.GetMollDetailsUseCase(gh<_i19.HomeRepository>()));
  gh.factory<_i29.GetAllMollUseCase>(
      () => _i29.GetAllMollUseCase(gh<_i19.HomeRepository>()));
  gh.factory<_i30.ChangeFavUseCase>(
      () => _i30.ChangeFavUseCase(gh<_i19.HomeRepository>()));
  gh.factory<_i31.HomeBloc>(() => _i31.HomeBloc(
        gh<_i28.GetMollDetailsUseCase>(),
        gh<_i29.GetAllMollUseCase>(),
        gh<_i23.GetAllDepartmentUseCase>(),
        gh<_i22.DepartmentDetailsUseCase>(),
        gh<_i27.GetProductDetailsUseCase>(),
        gh<_i25.GetDepartmentProductUseCase>(),
        gh<_i26.GetHomeUseCase>(),
        gh<_i24.GetFavProductUseCase>(),
        gh<_i30.ChangeFavUseCase>(),
      ));
  return getIt;
}

class _$AppModule extends _i32.AppModule {}

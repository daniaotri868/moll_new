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
import '../../feature/app/auth/domain/use_case/area_usecase.dart' as _i14;
import '../../feature/app/auth/domain/use_case/check_code_use_case.dart'
    as _i15;
import '../../feature/app/auth/domain/use_case/get_profile_usecase.dart'
    as _i16;
import '../../feature/app/auth/domain/use_case/register_use_case.dart' as _i17;
import '../../feature/app/auth/domain/use_case/update_profile_use_case.dart'
    as _i18;
import '../../feature/app/auth/presentation/bloc/auth_bloc.dart' as _i21;
import '../../feature/app/data/repository/prefs_repository_impl.dart' as _i8;
import '../../feature/app/domin/repositories/prefs_repository.dart' as _i7;
import '../../feature/app/home/data/data_source/home_remot_data_source.dart'
    as _i11;
import '../../feature/app/home/data/repo_imp/auth_repository_imp.dart' as _i20;
import '../../feature/app/home/domain/repo/home_repository.dart' as _i19;
import '../../feature/app/home/domain/use_case/cancel_order.dart' as _i22;
import '../../feature/app/home/domain/use_case/change_fav_usecase.dart' as _i23;
import '../../feature/app/home/domain/use_case/confirm_uscase.dart' as _i24;
import '../../feature/app/home/domain/use_case/department_details_use_case.dart'
    as _i25;
import '../../feature/app/home/domain/use_case/department_usecase.dart' as _i26;
import '../../feature/app/home/domain/use_case/driver_usecase.dart' as _i27;
import '../../feature/app/home/domain/use_case/get_all_fav_usecase.dart'
    as _i28;
import '../../feature/app/home/domain/use_case/get_department_product.dart'
    as _i29;
import '../../feature/app/home/domain/use_case/get_home_usecase.dart' as _i30;
import '../../feature/app/home/domain/use_case/get_order_usecase.dart' as _i31;
import '../../feature/app/home/domain/use_case/get_point_usecase.dart' as _i32;
import '../../feature/app/home/domain/use_case/get_product_details_usecase.dart'
    as _i33;
import '../../feature/app/home/domain/use_case/moll_details_use_case.dart'
    as _i34;
import '../../feature/app/home/domain/use_case/moll_name.dart' as _i35;
import '../../feature/app/home/domain/use_case/moll_use_case.dart' as _i36;
import '../../feature/app/home/domain/use_case/new_rate_order.dart' as _i37;
import '../../feature/app/home/domain/use_case/notifications_use_case.dart'
    as _i43;
import '../../feature/app/home/domain/use_case/order_details.dart' as _i38;
import '../../feature/app/home/domain/use_case/post_order.dart' as _i39;
import '../../feature/app/home/domain/use_case/rate_usecase.dart' as _i40;
import '../../feature/app/home/domain/use_case/search_usecase.dart' as _i41;
import '../../feature/app/home/domain/use_case/update_order.dart' as _i42;
import '../../feature/app/home/presentation/bloc/auth_bloc.dart' as _i44;
import '../../feature/app/presentation/bloc/app_manager_cubit.dart' as _i6;
import '../api/client.dart' as _i9;
import 'di_container.dart' as _i45;

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
  gh.factory<_i14.AreaUseCase>(
      () => _i14.AreaUseCase(gh<_i12.AuthRepository>()));
  gh.factory<_i15.CheckCodeUseCase>(
      () => _i15.CheckCodeUseCase(gh<_i12.AuthRepository>()));
  gh.factory<_i16.GetProfileUseCase>(
      () => _i16.GetProfileUseCase(gh<_i12.AuthRepository>()));
  gh.factory<_i17.RegisterUseCase>(
      () => _i17.RegisterUseCase(gh<_i12.AuthRepository>()));
  gh.factory<_i18.UpdateProfileUseCase>(
      () => _i18.UpdateProfileUseCase(gh<_i12.AuthRepository>()));
  gh.factory<_i19.HomeRepository>(() =>
      _i20.AuthRepositoryImpl(datasource: gh<_i11.HomeRemoteDataSource>()));
  gh.factory<_i21.AuthBloc>(() => _i21.AuthBloc(
        gh<_i17.RegisterUseCase>(),
        gh<_i15.CheckCodeUseCase>(),
        gh<_i18.UpdateProfileUseCase>(),
        gh<_i16.GetProfileUseCase>(),
        gh<_i14.AreaUseCase>(),
      ));
  gh.factory<_i22.CancelOrdersUseCase>(
      () => _i22.CancelOrdersUseCase(gh<_i19.HomeRepository>()));
  gh.factory<_i23.ChangeFavUseCase>(
      () => _i23.ChangeFavUseCase(gh<_i19.HomeRepository>()));
  gh.factory<_i24.ConfirmOrdersUseCase>(
      () => _i24.ConfirmOrdersUseCase(gh<_i19.HomeRepository>()));
  gh.factory<_i25.DepartmentDetailsUseCase>(
      () => _i25.DepartmentDetailsUseCase(gh<_i19.HomeRepository>()));
  gh.factory<_i26.GetAllDepartmentUseCase>(
      () => _i26.GetAllDepartmentUseCase(gh<_i19.HomeRepository>()));
  gh.factory<_i27.DriverUseCase>(
      () => _i27.DriverUseCase(gh<_i19.HomeRepository>()));
  gh.factory<_i28.GetFavProductUseCase>(
      () => _i28.GetFavProductUseCase(gh<_i19.HomeRepository>()));
  gh.factory<_i29.GetDepartmentProductUseCase>(
      () => _i29.GetDepartmentProductUseCase(gh<_i19.HomeRepository>()));
  gh.factory<_i30.GetHomeUseCase>(
      () => _i30.GetHomeUseCase(gh<_i19.HomeRepository>()));
  gh.factory<_i31.GetOrdersUseCase>(
      () => _i31.GetOrdersUseCase(gh<_i19.HomeRepository>()));
  gh.factory<_i32.MyPointsUseCase>(
      () => _i32.MyPointsUseCase(gh<_i19.HomeRepository>()));
  gh.factory<_i33.GetProductDetailsUseCase>(
      () => _i33.GetProductDetailsUseCase(gh<_i19.HomeRepository>()));
  gh.factory<_i34.GetMollDetailsUseCase>(
      () => _i34.GetMollDetailsUseCase(gh<_i19.HomeRepository>()));
  gh.factory<_i35.MollNameUseCase>(
      () => _i35.MollNameUseCase(gh<_i19.HomeRepository>()));
  gh.factory<_i36.GetAllMollUseCase>(
      () => _i36.GetAllMollUseCase(gh<_i19.HomeRepository>()));
  gh.factory<_i37.NewRateOrdersUseCase>(
      () => _i37.NewRateOrdersUseCase(gh<_i19.HomeRepository>()));
  gh.factory<_i38.OrderDetailsUseCase>(
      () => _i38.OrderDetailsUseCase(gh<_i19.HomeRepository>()));
  gh.factory<_i39.CreateOrdersUseCase>(
      () => _i39.CreateOrdersUseCase(gh<_i19.HomeRepository>()));
  gh.factory<_i40.RateOrdersUseCase>(
      () => _i40.RateOrdersUseCase(gh<_i19.HomeRepository>()));
  gh.factory<_i41.SearchHomeUseCase>(
      () => _i41.SearchHomeUseCase(gh<_i19.HomeRepository>()));
  gh.factory<_i42.UpdateOrdersUseCase>(
      () => _i42.UpdateOrdersUseCase(gh<_i19.HomeRepository>()));
  gh.factory<_i43.NotificationsUseCase>(
      () => _i43.NotificationsUseCase(repository: gh<_i19.HomeRepository>()));
  gh.factory<_i44.HomeBloc>(() => _i44.HomeBloc(
        gh<_i34.GetMollDetailsUseCase>(),
        gh<_i40.RateOrdersUseCase>(),
        gh<_i24.ConfirmOrdersUseCase>(),
        gh<_i38.OrderDetailsUseCase>(),
        gh<_i39.CreateOrdersUseCase>(),
        gh<_i31.GetOrdersUseCase>(),
        gh<_i36.GetAllMollUseCase>(),
        gh<_i26.GetAllDepartmentUseCase>(),
        gh<_i25.DepartmentDetailsUseCase>(),
        gh<_i33.GetProductDetailsUseCase>(),
        gh<_i29.GetDepartmentProductUseCase>(),
        gh<_i30.GetHomeUseCase>(),
        gh<_i28.GetFavProductUseCase>(),
        gh<_i23.ChangeFavUseCase>(),
        gh<_i42.UpdateOrdersUseCase>(),
        gh<_i32.MyPointsUseCase>(),
        gh<_i41.SearchHomeUseCase>(),
        gh<_i22.CancelOrdersUseCase>(),
        gh<_i37.NewRateOrdersUseCase>(),
        gh<_i43.NotificationsUseCase>(),
        gh<_i27.DriverUseCase>(),
        gh<_i35.MollNameUseCase>(),
      ));
  return getIt;
}

class _$AppModule extends _i45.AppModule {}

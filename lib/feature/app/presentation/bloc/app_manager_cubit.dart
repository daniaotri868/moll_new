import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/config/theme/app_theme.dart';

part 'app_manager_state.dart';

@lazySingleton
class AppManagerCubit extends Cubit<AppManagerState> {
  AppManagerCubit()
      : super(
          AppManagerState(
            lightThemeData: ThemeData.light(),
            darkThemeData: ThemeData.dark(),
          ),
        );

  changeAppTheme(BuildContext context) {
    emit(state.copyWith(
      darkThemeData: AppTheme.dark(context),
      lightThemeData: AppTheme.light(context),
    ));
  }

  onSaveCountryCode(String? countryCode) {
    emit(state.copyWith(countryCode: countryCode));
  }
}

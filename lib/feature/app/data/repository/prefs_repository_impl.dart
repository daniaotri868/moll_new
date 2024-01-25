import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../common/constants/prefs_key.dart';
import '../../../../core/config/theme/app_theme.dart';
import '../../domin/repositories/prefs_repository.dart';

@Injectable(as: PrefsRepository)
class PrefsRepositoryImpl extends PrefsRepository {
  PrefsRepositoryImpl(this._preferences);

  final SharedPreferences _preferences;

  @override
  Future<bool> setToken(String token) => _preferences.setString(PrefsKey.token, token);

  @override
  String? get token => _preferences.getString(PrefsKey.token);

  @override
  ThemeMode get getTheme {
    final res = _preferences.getString(PrefsKey.theme);
    if (res == null) {
      setTheme(defaultAppTheme);
      return defaultAppTheme;
    }
    return mapAppThemeMode[res]!;
  }

  @override
  Future<bool> setTheme(ThemeMode themeMode) => _preferences.setString(PrefsKey.theme, themeMode.name);

  @override
  Future<bool> clearUser() async {
    return (await Future.wait([
      _preferences.remove(PrefsKey.token),
      _preferences.remove(PrefsKey.user),
      _preferences.clear(),
    ]))
        .reduce((value, element) => value && element);
  }

  @override
  bool get registeredUser => token != null;



  @override
  String? get refreshToken =>  _preferences.getString(PrefsKey.refreshToken);

  @override
  Future<bool> setRefreshToken(String refreshToken) {
    return _preferences.setString(PrefsKey.refreshToken, refreshToken);
  }

  @override
  Future<bool> setCompleteInfo(int step) {
 return _preferences.setInt(PrefsKey.numberStep, step);
  }

  @override
  
  int? get step => _preferences.getInt(PrefsKey.numberStep);


}



import 'package:flutter/material.dart';


abstract class PrefsRepository{
  String? get token;
  Future<bool> setToken(String token);
  Future<bool> setRefreshToken(String refreshToken);
  Future<bool> setTheme(ThemeMode themeMode);
  ThemeMode get getTheme;
  Future<bool> clearUser();
  bool get registeredUser;
  String? get refreshToken;
  Future<bool> setCompleteInfo(int step);
  int? get step;
}
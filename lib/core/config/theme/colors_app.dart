import 'package:flutter/material.dart';

abstract class AppColors {
  const AppColors._();

  static const MaterialColor primary = MaterialColor(
    _primaryPrimaryValue,
    <int, Color>{
      500: Color(_primaryPrimaryValue),
    },
  );

  static const int _primaryPrimaryValue = 0xffD81F72;

  static const MaterialColor dark = MaterialColor(
    _darkPrimaryValue,
    <int, Color>{
      500: Color(_darkPrimaryValue),
    },
  );

  static const int _darkPrimaryValue = 0xff142550;

  static const MaterialColor grey = MaterialColor(
    _greyPrimaryValue,
    <int, Color>{
      50: Color(0xfffdfbff),
      100: Color(0xffd6d5d6),
      200: Color(0xffB0B4BD),
      300: Color(0xffa6a3a6),
      400: Color(0xff959195),
      500: Color(_greyPrimaryValue),
      600: Color(0xff6f6b6f),
      700: Color(0xff575457),
      800: Color(0xff434143),
      900: Color(0xff333233),
    },
  );

  static const int _greyPrimaryValue = 0xff989898;
  static const Color navGray=Color(0xFFF5F5F5);
  static const Color whiteGrey=Color(0xffF0F0F0);
  static const Color fillTextField=Color(0xffF6F6F6);
  static const Color redOpacity=Color(0xffffd9d8);
  static const Color red=Color(0xffFF0000);
  static const Color backgroundDark = Color(0xFF001B3D);
  static const Color borderTextField=Color(0xffD1D1D1);
  static const Color blueTabBar = Color(0xFF00B8DC);
  static const Color backGroundGreyWhite = Color(0xFFF5F5F5);
  static const Color borderOtp = Color(0xFFD1D1D1);
  static const Color buttonLogOut=Color(0xffFFF5F5);
}

Color darken(Color color, [double amount = .1]) {
  assert(amount >= 0 && amount <= 1);

  final hsl = HSLColor.fromColor(color);
  final hslDark = hsl.withLightness((hsl.lightness - amount).clamp(0.0, 1.0));

  return hslDark.toColor();
}

Color lighten(Color color, [double amount = .1]) {
  assert(amount >= 0 && amount <= 1);

  final hsl = HSLColor.fromColor(color);
  final hslLight = hsl.withLightness((hsl.lightness + amount).clamp(0.0, 1.0));

  return hslLight.toColor();
}

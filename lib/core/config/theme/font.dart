part of 'typography.dart';

FontWeight get _light => FontWeight.w300;

FontWeight get _regular => FontWeight.normal;

FontWeight get _medium => FontWeight.w500;

FontWeight get _semiBold => FontWeight.w600;

FontWeight get _bold => FontWeight.bold;

FontWeight get _extraBold => FontWeight.w800;

String get noorBoldFamily => 'Noor Bold';
String get noorRegularFamily => 'Noor Regular';

extension FontExt on TextStyle? {
  TextStyle? get xb => this?.copyWith(fontWeight: _extraBold);

  TextStyle? get b => this?.copyWith(fontWeight: _bold,fontFamily: noorBoldFamily);

  TextStyle? get sb => this?.copyWith(fontWeight: _semiBold);

  TextStyle? get r => this?.copyWith(fontWeight: _regular,fontFamily: noorRegularFamily);

  TextStyle? get m => this?.copyWith(fontWeight: _medium);

  TextStyle? get l => this?.copyWith(fontWeight: _light);


  TextStyle? withColor(Color? color) => this?.copyWith(color: color);
}

abstract class _FontSize {
  static double get displayLarge => _displayLargeFontSize.sp;
  static const double _displayLargeFontSize = 57;

  static double get displayMedium => _displayMediumFontSize.sp;
  static const double _displayMediumFontSize = 45;

  static double get displaySmall => _displaySmallFontSize.sp;
  static const double _displaySmallFontSize = 36;

  static double get headlineLarge => _headlineLargeSize.sp;
  static const double _headlineLargeSize = 32;

  static double get headlineMedium => _headlineMediumFontSize.sp;
  static const double _headlineMediumFontSize = 28;

  static double get headlineSmall => _headlineSmallFontSize.sp;
  static const double _headlineSmallFontSize = 24;

  static double get titleLarge => _titleLargeFontSize.sp;
  static const double _titleLargeFontSize = 22;

  static double get titleMedium => _titleMediumFontSize.sp;
  static const double _titleMediumFontSize = 16;

  static double get titleSmall => _titleSmallFontSize.sp;
  static const double _titleSmallFontSize = 14;

  static double get bodyLarge => _bodyLargeSize.sp;
  static const double _bodyLargeSize = 18;

  static double get bodyMedium => _bodyMediumFontSize.sp;
  static const double _bodyMediumFontSize = 13;

  static double get bodySmall => _bodySmallFontSize.sp;
  static const double _bodySmallFontSize = 10;

  static double get labelLarge => _labelLargeFontSize.sp;
  static const double _labelLargeFontSize = 18;

  static double get labelMedium => _labelMediumFontSize.sp;
  static const double _labelMediumFontSize = 10;

  static double get labelSmall => _labelSmallFontSize.sp;
  static const double _labelSmallFontSize = 8;
}

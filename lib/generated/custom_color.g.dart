// import 'package:dynamic_color/dynamic_color.dart';
// import 'package:flutter/material.dart';
//
// const primary = Color(0xFF00D5FF);
// const secondary = Color(0xFF00FFF8);
// const tertiary = Color(0xFF323232);
//
//
// CustomColors lightCustomColors = const CustomColors(
//   sourcePrimary: Color(0xFF00D5FF),
//   primary: Color(0xFF00677D),
//   onPrimary: Color(0xFFFFFFFF),
//   primaryContainer: Color(0xFFB3EBFF),
//   onPrimaryContainer: Color(0xFF001F27),
//   sourceSecondary: Color(0xFF00FFF8),
//   secondary: Color(0xFF006A67),
//   onSecondary: Color(0xFFFFFFFF),
//   secondaryContainer: Color(0xFF00FCF5),
//   onSecondaryContainer: Color(0xFF00201F),
//   sourceTertiary: Color(0xFF323232),
//   tertiary: Color(0xFF006874),
//   onTertiary: Color(0xFFFFFFFF),
//   tertiaryContainer: Color(0xFF97F0FF),
//   onTertiaryContainer: Color(0xFF001F24),
// );
//
// CustomColors darkCustomColors = const CustomColors(
//   sourcePrimary: Color(0xFF00D5FF),
//   primary: Color(0xFF35D7FF),
//   onPrimary: Color(0xFF003642),
//   primaryContainer: Color(0xFF004E5F),
//   onPrimaryContainer: Color(0xFFB3EBFF),
//   sourceSecondary: Color(0xFF00FFF8),
//   secondary: Color(0xFF00DDD7),
//   onSecondary: Color(0xFF003735),
//   secondaryContainer: Color(0xFF00504D),
//   onSecondaryContainer: Color(0xFF00FCF5),
//   sourceTertiary: Color(0xFF323232),
//   tertiary: Color(0xFF4FD8EB),
//   onTertiary: Color(0xFF00363D),
//   tertiaryContainer: Color(0xFF004F58),
//   onTertiaryContainer: Color(0xFF97F0FF),
// );
//
//
//
// /// Defines a set of custom colors, each comprised of 4 complementary tones.
// ///
// /// See also:
// ///   * <https://m3.material.io/styles/color/the-color-system/custom-colors>
// @immutable
// class CustomColors extends ThemeExtension<CustomColors> {
//   const CustomColors({
//     required this.sourcePrimary,
//     required this.primary,
//     required this.onPrimary,
//     required this.primaryContainer,
//     required this.onPrimaryContainer,
//     required this.sourceSecondary,
//     required this.secondary,
//     required this.onSecondary,
//     required this.secondaryContainer,
//     required this.onSecondaryContainer,
//     required this.sourceTertiary,
//     required this.tertiary,
//     required this.onTertiary,
//     required this.tertiaryContainer,
//     required this.onTertiaryContainer,
//   });
//
//   final Color? sourcePrimary;
//   final Color? primary;
//   final Color? onPrimary;
//   final Color? primaryContainer;
//   final Color? onPrimaryContainer;
//   final Color? sourceSecondary;
//   final Color? secondary;
//   final Color? onSecondary;
//   final Color? secondaryContainer;
//   final Color? onSecondaryContainer;
//   final Color? sourceTertiary;
//   final Color? tertiary;
//   final Color? onTertiary;
//   final Color? tertiaryContainer;
//   final Color? onTertiaryContainer;
//
//   @override
//   CustomColors copyWith({
//     Color? sourcePrimary,
//     Color? primary,
//     Color? onPrimary,
//     Color? primaryContainer,
//     Color? onPrimaryContainer,
//     Color? sourceSecondary,
//     Color? secondary,
//     Color? onSecondary,
//     Color? secondaryContainer,
//     Color? onSecondaryContainer,
//     Color? sourceTertiary,
//     Color? tertiary,
//     Color? onTertiary,
//     Color? tertiaryContainer,
//     Color? onTertiaryContainer,
//   }) {
//     return CustomColors(
//       sourcePrimary: sourcePrimary ?? this.sourcePrimary,
//       primary: primary ?? this.primary,
//       onPrimary: onPrimary ?? this.onPrimary,
//       primaryContainer: primaryContainer ?? this.primaryContainer,
//       onPrimaryContainer: onPrimaryContainer ?? this.onPrimaryContainer,
//       sourceSecondary: sourceSecondary ?? this.sourceSecondary,
//       secondary: secondary ?? this.secondary,
//       onSecondary: onSecondary ?? this.onSecondary,
//       secondaryContainer: secondaryContainer ?? this.secondaryContainer,
//       onSecondaryContainer: onSecondaryContainer ?? this.onSecondaryContainer,
//       sourceTertiary: sourceTertiary ?? this.sourceTertiary,
//       tertiary: tertiary ?? this.tertiary,
//       onTertiary: onTertiary ?? this.onTertiary,
//       tertiaryContainer: tertiaryContainer ?? this.tertiaryContainer,
//       onTertiaryContainer: onTertiaryContainer ?? this.onTertiaryContainer,
//     );
//   }
//
//   @override
//   CustomColors lerp(ThemeExtension<CustomColors>? other, double t) {
//     if (other is! CustomColors) {
//       return this;
//     }
//     return CustomColors(
//       sourcePrimary: Color.lerp(sourcePrimary, other.sourcePrimary, t),
//       primary: Color.lerp(primary, other.primary, t),
//       onPrimary: Color.lerp(onPrimary, other.onPrimary, t),
//       primaryContainer: Color.lerp(primaryContainer, other.primaryContainer, t),
//       onPrimaryContainer: Color.lerp(onPrimaryContainer, other.onPrimaryContainer, t),
//       sourceSecondary: Color.lerp(sourceSecondary, other.sourceSecondary, t),
//       secondary: Color.lerp(secondary, other.secondary, t),
//       onSecondary: Color.lerp(onSecondary, other.onSecondary, t),
//       secondaryContainer: Color.lerp(secondaryContainer, other.secondaryContainer, t),
//       onSecondaryContainer: Color.lerp(onSecondaryContainer, other.onSecondaryContainer, t),
//       sourceTertiary: Color.lerp(sourceTertiary, other.sourceTertiary, t),
//       tertiary: Color.lerp(tertiary, other.tertiary, t),
//       onTertiary: Color.lerp(onTertiary, other.onTertiary, t),
//       tertiaryContainer: Color.lerp(tertiaryContainer, other.tertiaryContainer, t),
//       onTertiaryContainer: Color.lerp(onTertiaryContainer, other.onTertiaryContainer, t),
//     );
//   }
//
//   /// Returns an instance of [CustomColors] in which the following custom
//   /// colors are harmonized with [dynamic]'s [ColorScheme.primary].
//   ///
//   /// See also:
//   ///   * <https://m3.material.io/styles/color/the-color-system/custom-colors#harmonization>
//   CustomColors harmonized(ColorScheme dynamic) {
//     return copyWith(
//     );
//   }
// }
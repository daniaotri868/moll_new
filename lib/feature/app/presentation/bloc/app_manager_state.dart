part of 'app_manager_cubit.dart';

@immutable
class AppManagerState {
  const AppManagerState( {
    required this.lightThemeData,
    required this.darkThemeData,
    this.countryCode,
  });

  final ThemeData lightThemeData;
  final ThemeData darkThemeData;
  final String? countryCode;
  AppManagerState copyWith({
    ThemeData? lightThemeData,
    ThemeData? darkThemeData,
    String? countryCode
  }) {
    return AppManagerState(
      countryCode:countryCode?? this.countryCode,
      lightThemeData: lightThemeData ?? this.lightThemeData,
      darkThemeData: darkThemeData ?? this.darkThemeData,
    );
  }
}

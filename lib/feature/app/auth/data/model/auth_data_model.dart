import 'package:freezed_annotation/freezed_annotation.dart';
part 'auth_data_model.freezed.dart';
part 'auth_data_model.g.dart';


@freezed
abstract class AuthData with _$AuthData {
  const factory AuthData({
    required   String token,
    required  String status,
    required  String userId,
    required String refreshToken,
  }) = _AuthData;

  factory AuthData.fromJson(Map<String, dynamic> json) => _$AuthDataFromJson(json);
}



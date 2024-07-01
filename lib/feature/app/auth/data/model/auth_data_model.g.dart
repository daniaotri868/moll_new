// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_data_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AuthDataImpl _$$AuthDataImplFromJson(Map<String, dynamic> json) =>
    _$AuthDataImpl(
      token: json['token'] as String,
      status: json['status'] as String,
      userId: json['userId'] as String,
      refreshToken: json['refreshToken'] as String,
    );

Map<String, dynamic> _$$AuthDataImplToJson(_$AuthDataImpl instance) =>
    <String, dynamic>{
      'token': instance.token,
      'status': instance.status,
      'userId': instance.userId,
      'refreshToken': instance.refreshToken,
    };

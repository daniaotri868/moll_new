import 'package:freezed_annotation/freezed_annotation.dart';


part 'payload_model.freezed.dart';

part 'payload_model.g.dart';

@freezed
class PayloadModel with _$PayloadModel {

  const factory PayloadModel({
    String? title,
    String? body,
    // @JsonKey(name: "Id") required String id,
    // @JsonKey(name: "NotificationId") required String notificationId,

  }) = _PayloadModel;


  factory PayloadModel.fromJson(Map<String, dynamic> json) => _$PayloadModelFromJson(json);

}



enum NotificationTypeName {
  none
}
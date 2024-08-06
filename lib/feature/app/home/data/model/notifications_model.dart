import 'dart:convert';

class NotificationsModel {
  final String? title;
  final String? body;
  final String? dateCreated;

  NotificationsModel({
    required this.title,
    required this.body,
    required this.dateCreated,
  });

  NotificationsModel copyWith({
    String? title,
    String? body,
    String? dateCreated,
  }) =>
      NotificationsModel(
        title: title ?? this.title,
        body: body ?? this.body,
        dateCreated: dateCreated ?? this.dateCreated,
      );

  factory NotificationsModel.fromJson(String str) => NotificationsModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory NotificationsModel.fromMap(Map<String, dynamic> json) => NotificationsModel(
    title: json["title"]??"",
    body: json["body"]??"",
    dateCreated:json["dateCreated"]??"",
  );

  Map<String, dynamic> toMap() => {
    "title": title,
    "body": body,
    "dateCreated": dateCreated,
  };
}

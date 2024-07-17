// To parse this JSON data, do
//
//     final allOrderModel = allOrderModelFromJson(jsonString);

import 'dart:convert';

List<AllOrderModel> allOrderModelFromJson(String str) => List<AllOrderModel>.from(json.decode(str).map((x) => AllOrderModel.fromJson(x)));

String allOrderModelToJson(List<AllOrderModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class AllOrderModel {
  final String ?id;
  final DateTime ?dateCreated;
  final String ?number;
  final int ?productsCount;
  final String ?status;
  final String ?reason;
  final int ?cost;

  AllOrderModel({
    this.id,
    this.dateCreated,
    this.number,
    this.productsCount,
    this.status,
    this.reason,
    this.cost,
  });

  factory AllOrderModel.fromJson(Map<String, dynamic> json) => AllOrderModel(
    id: json["id"],
    dateCreated: DateTime.parse(json["dateCreated"]),
    number: json["number"],
    productsCount: json["productsCount"],
    status: json["status"],
    reason: json["reason"],
    cost: json["cost"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "dateCreated": dateCreated?.toIso8601String(),
    "number": number,
    "productsCount": productsCount,
    "status": status,
    "reason": reason,
    "cost": cost,
  };
}

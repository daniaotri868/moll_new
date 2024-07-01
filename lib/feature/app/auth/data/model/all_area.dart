// To parse this JSON data, do
//
//     final allAreaModel = allAreaModelFromJson(jsonString);

import 'dart:convert';

List<AllAreaModel> allAreaModelFromJson(String str) => List<AllAreaModel>.from(json.decode(str).map((x) => AllAreaModel.fromJson(x)));

String allAreaModelToJson(List<AllAreaModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class AllAreaModel {
  final String ?id;
  final String ?name;

  AllAreaModel({
    this.id,
    this.name,
  });

  factory AllAreaModel.fromJson(Map<String, dynamic> json) => AllAreaModel(
    id: json["id"],
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
  };
}

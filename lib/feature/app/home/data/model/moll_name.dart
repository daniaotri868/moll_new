// To parse this JSON data, do
//
//     final allMollNameModel = allMollNameModelFromJson(jsonString);

import 'dart:convert';

List<AllMollNameModel> allMollNameModelFromJson(String str) => List<AllMollNameModel>.from(json.decode(str).map((x) => AllMollNameModel.fromJson(x)));

String allMollNameModelToJson(List<AllMollNameModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class AllMollNameModel {
  final String ?id;
  final String ?name;

  AllMollNameModel({
    this.id,
    this.name,
  });

  factory AllMollNameModel.fromJson(Map<String, dynamic> json) => AllMollNameModel(
    id: json["id"],
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
  };
}

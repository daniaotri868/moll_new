// To parse this JSON data, do
//
//     final getAllDepartmentDetailsModel = getAllDepartmentDetailsModelFromJson(jsonString);

import 'dart:convert';

GetAllDepartmentDetailsModel getAllDepartmentDetailsModelFromJson(String str) => GetAllDepartmentDetailsModel.fromJson(json.decode(str));

String getAllDepartmentDetailsModelToJson(GetAllDepartmentDetailsModel data) => json.encode(data.toJson());

class GetAllDepartmentDetailsModel {
  final String ?id;
  final String ?name;
  final String ?phoneNumber;
  final String ?imageUrl;
  final List<String> ?subImageUrls;
  final DepartmentOffer ?departmentOffer;
  final List<dynamic> ?ads;

  GetAllDepartmentDetailsModel({
    this.id,
    this.name,
    this.phoneNumber,
    this.imageUrl,
    this.subImageUrls,
    this.departmentOffer,
    this.ads,
  });

  factory GetAllDepartmentDetailsModel.fromJson(Map<String, dynamic> json) => GetAllDepartmentDetailsModel(
    id: json["id"],
    name: json["name"],
    phoneNumber: json["phoneNumber"],
    imageUrl: json["imageUrl"],
    subImageUrls: List<String>.from(json["subImageUrls"].map((x) => x)),
    departmentOffer: DepartmentOffer.fromJson(json["departmentOffer"]),
    ads: List<dynamic>.from(json["ads"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "phoneNumber": phoneNumber,
    "imageUrl": imageUrl,
    "subImageUrls": List<dynamic>.from((subImageUrls??[]).map((x) => x)),
    "departmentOffer": departmentOffer?.toJson(),
    "ads": List<dynamic>.from((ads??[]).map((x) => x)),
  };
}

class DepartmentOffer {
  final String ?id;
  final String ?name;
  final String ?type;
  final int ?value;
  final DateTime ?startDate;
  final DateTime ?endDate;

  DepartmentOffer({
    this.id,
    this.name,
    this.type,
    this.value,
    this.startDate,
    this.endDate,
  });

  factory DepartmentOffer.fromJson(Map<String, dynamic> json) => DepartmentOffer(
    id: json["id"],
    name: json["name"],
    type: json["type"],
    value: json["value"],
    startDate: DateTime.parse(json["startDate"]),
    endDate: DateTime.parse(json["endDate"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "type": type,
    "value": value,
    "startDate": startDate?.toIso8601String(),
    "endDate": endDate?.toIso8601String(),
  };
}

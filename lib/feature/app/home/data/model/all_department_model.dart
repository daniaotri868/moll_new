// To parse this JSON data, do
//
//     final getAllDepartmentModel = getAllDepartmentModelFromJson(jsonString);

import 'dart:convert';

GetAllDepartmentModel getAllDepartmentModelFromJson(String str) => GetAllDepartmentModel.fromJson(json.decode(str));

String getAllDepartmentModelToJson(GetAllDepartmentModel data) => json.encode(data.toJson());

class GetAllDepartmentModel {
  final int ?count;
  final List<Department> ?departments;

  GetAllDepartmentModel({
    this.count,
    this.departments,
  });

  factory GetAllDepartmentModel.fromJson(Map<String, dynamic> json) => GetAllDepartmentModel(
    count: json["count"],
    departments: List<Department>.from(json["departments"].map((x) => Department.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "count": count,
    "departments": List<dynamic>.from((departments??[]).map((x) => x.toJson())),
  };
}

class Department {
  final String ?id;
  final String ?name;
  final String ?imageUrl;
  final String ?phoneNumber;

  Department({
    this.id,
    this.name,
    this.imageUrl,
    this.phoneNumber,
  });

  factory Department.fromJson(Map<String, dynamic> json) => Department(
    id: json["id"],
    name: json["name"],
    imageUrl: json["imageUrl"],
    phoneNumber: json["phoneNumber"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "imageUrl": imageUrl,
    "phoneNumber": phoneNumber,
  };
}

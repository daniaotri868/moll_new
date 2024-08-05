// To parse this JSON data, do
//
//     final searchHomeModel = searchHomeModelFromJson(jsonString);

import 'dart:convert';

import 'package:remy/feature/app/home/data/model/home_model.dart';

SearchHomeModel searchHomeModelFromJson(String str) => SearchHomeModel.fromJson(json.decode(str));

String searchHomeModelToJson(SearchHomeModel data) => json.encode(data.toJson());

class SearchHomeModel {
  final List<ProductItem> ?products;
  final List<Department> ?departments;
  final List<Mall> ?malls;

  SearchHomeModel({
    this.products,
    this.departments,
    this.malls,
  });

  factory SearchHomeModel.fromJson(Map<String, dynamic> json) => SearchHomeModel(
    products: List<ProductItem>.from(json["products"].map((x) => ProductItem.fromJson(x))),
    departments: List<Department>.from(json["departments"].map((x) => Department.fromJson(x))),
    malls: List<Mall>.from(json["malls"].map((x) => Mall.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "products": List<dynamic>.from((products??[]).map((x) => x.toJson())),
    "departments": List<dynamic>.from((departments??[]).map((x) => x.toJson())),
    "malls": List<dynamic>.from((malls??[]).map((x) => x.toJson())),
  };
}

class Department {
  final String ?id;
  final String ?name;
  final String ?phoneNumber;
  final String ?imageUrl;
  final String ?mallId;
  final String ?mallName;

  Department({
    this.id,
    this.name,
    this.phoneNumber,
    this.imageUrl,
    this.mallId,
    this.mallName,
  });

  factory Department.fromJson(Map<String, dynamic> json) => Department(
    id: json["id"],
    name: json["name"],
    phoneNumber: json["phoneNumber"],
    imageUrl: json["imageUrl"],
    mallId: json["mallId"],
    mallName: json["mallName"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "phoneNumber": phoneNumber,
    "imageUrl": imageUrl,
    "mallId": mallId,
    "mallName": mallName,
  };
}

class Mall {
  final String ?id;
  final String ?name;
  final int ?evaluation;
  final String ?imageUrl;

  Mall({
    this.id,
    this.name,
    this.evaluation,
    this.imageUrl,
  });

  factory Mall.fromJson(Map<String, dynamic> json) => Mall(
    id: json["id"],
    name: json["name"],
    evaluation: json["evaluation"],
    imageUrl: json["imageUrl"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "evaluation": evaluation,
    "imageUrl": imageUrl,
  };
}

class Product {
  final String ?id;
  final String ?name;
  final String ?mallId;
  final String ?mallName;
  final String ?departmentId;
  final String ?departmentName;
  final String ?imageUrl;
  final bool ?isFavourite;
  final int ?price;
  final int ?evaluation;

  Product({
    this.id,
    this.name,
    this.mallId,
    this.mallName,
    this.departmentId,
    this.departmentName,
    this.imageUrl,
    this.isFavourite,
    this.price,
    this.evaluation,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
    id: json["id"],
    name: json["name"],
    mallId: json["mallId"],
    mallName: json["mallName"],
    departmentId: json["departmentId"],
    departmentName: json["departmentName"],
    imageUrl: json["imageUrl"],
    isFavourite: json["isFavourite"],
    price: json["price"],
    evaluation: json["evaluation"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "mallId": mallId,
    "mallName": mallName,
    "departmentId": departmentId,
    "departmentName": departmentName,
    "imageUrl": imageUrl,
    "isFavourite": isFavourite,
    "price": price,
    "evaluation": evaluation,
  };
}

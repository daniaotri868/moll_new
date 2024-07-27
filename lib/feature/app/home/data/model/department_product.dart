// To parse this JSON data, do
//
//     final getAllDepartmentProductModel = getAllDepartmentProductModelFromJson(jsonString);

import 'dart:convert';

GetAllDepartmentProductModel getAllDepartmentProductModelFromJson(String str) => GetAllDepartmentProductModel.fromJson(json.decode(str));

String getAllDepartmentProductModelToJson(GetAllDepartmentProductModel data) => json.encode(data.toJson());

class GetAllDepartmentProductModel {
  final int ?count;
  final List<ProductDp> ?products;

  GetAllDepartmentProductModel({
    this.count,
    this.products,
  });

  factory GetAllDepartmentProductModel.fromJson(Map<String, dynamic> json) => GetAllDepartmentProductModel(
    count: json["count"],
    products: List<ProductDp>.from(json["products"].map((x) => ProductDp.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "count": count,
    "products": List<dynamic>.from((products??[]).map((x) => x.toJson())),
  };
}

class ProductDp {
  final String ?id;
  final String ?name;
  final int ?price;
  final int ?quantity;
  final String ?imageUrl;
  final String ?mallId;
  final dynamic ?evaluation;
  final bool ?hasDiscount;
  final dynamic ?priceAfterDiscount;

  ProductDp({
    this.id,
    this.name,
    this.price,
    this.quantity,
    this.imageUrl,
    this.evaluation,
    this.hasDiscount,
    this.mallId,
    this.priceAfterDiscount,
  });

  factory ProductDp.fromJson(Map<String, dynamic> json) => ProductDp(
    id: json["id"],
    name: json["name"],
    price: json["price"],
    quantity: json["quantity"],
    imageUrl: json["imageUrl"],
    evaluation: json["evaluation"],
    hasDiscount: json["hasDiscount"],
    mallId: json["mallId"],
    priceAfterDiscount: json["priceAfterDiscount"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "price": price,
    "quantity": quantity,
    "imageUrl": imageUrl,
    "evaluation": evaluation,
    "hasDiscount": hasDiscount,
    "mallId": mallId,
    "priceAfterDiscount": priceAfterDiscount,
  };
}

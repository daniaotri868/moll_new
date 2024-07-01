// To parse this JSON data, do
//
//     final getProductDetailsModel = getProductDetailsModelFromJson(jsonString);

import 'dart:convert';

GetProductDetailsModel getProductDetailsModelFromJson(String str) => GetProductDetailsModel.fromJson(json.decode(str));

String getProductDetailsModelToJson(GetProductDetailsModel data) => json.encode(data.toJson());

class GetProductDetailsModel {
  final String ?id;
  final String ?name;
  final String ?imageUrl;
  final List<String> ?subImageUrls;
  final int ?evaluation;
  final int ?quantity;
  final int ?price;
  final bool ?isFavourite;
  final String ?departmentId;
  final String ?departmentName;
  final String ?mallId;
  final String ?mallName;
  final Offer ?offer;

  GetProductDetailsModel({
    this.id,
    this.name,
    this.imageUrl,
    this.subImageUrls,
    this.evaluation,
    this.quantity,
    this.price,
    this.isFavourite,
    this.departmentId,
    this.departmentName,
    this.mallId,
    this.mallName,
    this.offer,
  });

  factory GetProductDetailsModel.fromJson(Map<String, dynamic> json) => GetProductDetailsModel(
    id: json["id"],
    name: json["name"],
    imageUrl: json["imageUrl"],
    subImageUrls: List<String>.from(json["subImageUrls"].map((x) => x)),
    evaluation: json["evaluation"],
    quantity: json["quantity"],
    price: json["price"],
    isFavourite: json["isFavourite"],
    departmentId: json["departmentId"],
    departmentName: json["departmentName"],
    mallId: json["mallId"],
    mallName: json["mallName"],
    offer: Offer.fromJson(json["offer"]==null?{}:json["offer"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "imageUrl": imageUrl,
    "subImageUrls": List<dynamic>.from((subImageUrls??[]).map((x) => x)),
    "evaluation": evaluation,
    "quantity": quantity,
    "price": price,
    "isFavourite": isFavourite,
    "departmentId": departmentId,
    "departmentName": departmentName,
    "mallId": mallId,
    "mallName": mallName,
    "offer": offer?.toJson(),
  };
}

class Offer {
  final String ?id;
  final String ?name;
  final String ?type;
  final int ?value;
  final int ?priceAfterDiscount;
  final DateTime ?startDate;
  final DateTime ?endDate;

  Offer({
    this.id,
    this.name,
    this.type,
    this.value,
    this.priceAfterDiscount,
    this.startDate,
    this.endDate,
  });

  factory Offer.fromJson(Map<String, dynamic> json) => Offer(
    id: json["id"],
    name: json["name"],
    type: json["type"],
    value: json["value"],
    priceAfterDiscount: json["priceAfterDiscount"],
    // startDate: DateTime.parse(json["startDate"]),
    // endDate: DateTime.parse(json["endDate"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "type": type,
    "value": value,
    "priceAfterDiscount": priceAfterDiscount,
    "startDate": startDate?.toIso8601String(),
    "endDate": endDate?.toIso8601String(),
  };
}

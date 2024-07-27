// To parse this JSON data, do
//
//     final orderDetailsModel = orderDetailsModelFromJson(jsonString);

import 'dart:convert';

OrderDetailsModel orderDetailsModelFromJson(String str) => OrderDetailsModel.fromJson(json.decode(str));

String orderDetailsModelToJson(OrderDetailsModel data) => json.encode(data.toJson());

class OrderDetailsModel {
  final String ?id;
  final String ?mallId;
  final String ?mallName;
  final int ?totalCost;
  final int ?finalCost;
  final int ?deliveryCost;
  final String ?number;
  final String ?note;
  final String ?address;
  final int ?distance;
  final int ?pointsCanUse;
  final int ?pointValue;
  final String ?currentStage;
  final List<Product> ?products;

  OrderDetailsModel({
    this.id,
    this.mallId,
    this.mallName,
    this.totalCost,
    this.finalCost,
    this.deliveryCost,
    this.number,
    this.pointValue,
    this.pointsCanUse,
    this.note,
    this.address,
    this.distance,
    this.currentStage,
    this.products,
  });

  factory OrderDetailsModel.fromJson(Map<String, dynamic> json) => OrderDetailsModel(
    id: json["id"],
    mallId: json["mallId"],
    mallName: json["mallName"],
    totalCost: json["totalCost"],
    finalCost: json["finalCost"],
    deliveryCost: json["deliveryCost"],
    number: json["number"],
    note: json["note"],
    address: json["address"],
    distance: json["distance"],
    pointsCanUse: json["pointsCanUse"],
    pointValue: json["pointValue"],
    currentStage: json["currentStage"],
    products: List<Product>.from(json["products"].map((x) => Product.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "mallId": mallId,
    "mallName": mallName,
    "totalCost": totalCost,
    "finalCost": finalCost,
    "deliveryCost": deliveryCost,
    "number": number,
    "note": note,
    "address": address,
    "distance": distance,
    "currentStage": currentStage,
    "products": List<dynamic>.from((products??[]).map((x) => x.toJson())),
  };
}

class Product {
  final String ?id;
  final String ?name;
  final String ?imageUrl;
  final int ?quantity;
  final int ?price;
  final int ?finalPrice;
  final bool ?hasOffer;
  final String ?offerId;

  Product({
    this.id,
    this.name,
    this.imageUrl,
    this.quantity,
    this.price,
    this.finalPrice,
    this.hasOffer,
    this.offerId,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
    id: json["id"],
    name: json["name"],
    quantity: json["quantity"],
    price: json["price"],
    finalPrice: json["finalPrice"],
    hasOffer: json["hasOffer"],
    offerId: json["offerId"],
    imageUrl: json["imageUrl"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "quantity": quantity,
    "price": price,
    "finalPrice": finalPrice,
    "hasOffer": hasOffer,
    "offerId": offerId,
    "imageUrl": imageUrl,
  };
}
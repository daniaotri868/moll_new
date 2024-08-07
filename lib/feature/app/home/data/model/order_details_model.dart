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
  final String ?areaName;
  final double ?lat;
  final double ?lng;
  final double ?mallLat;
  final double ?mallLng;
  final int ?usedPoints;
  final int ?totalCost;
  final int ?finalCost;
  final int ?deliveryCost;
  final String ?number;
  final String ?note;
  final String ?status;
  final String ?address;
  final int ?distance;
  final int ?pointsCanUse;
  final int ?pointValue;
  final String ?currentStage;
  final List<Product> ?products;

  OrderDetailsModel({
    this.id,
    this.mallId,
    this.status,
    this.mallLng,
    this.mallLat,
    this.usedPoints,
    this.mallName,
    this.lng,
    this.lat,
    this.areaName,
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
    status: json["status"],
    lng: json["lng"],
    mallLat: json["mallLat"],
    mallLng: json["mallLng"],
    lat: json["lat"],
    usedPoints: json["usedPoints"],
    mallName: json["mallName"],
    areaName: json["areaName"],
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
    "lng": lng,
    "status": status,
    "lat": lat,
    "mallLng": mallLng,
    "mallLat": mallLat,
    "areaName": areaName,
    "usedPoints": usedPoints,
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

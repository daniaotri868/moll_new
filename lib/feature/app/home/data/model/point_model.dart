// To parse this JSON data, do
//
//     final myPointsModel = myPointsModelFromJson(jsonString);

import 'dart:convert';

List<MyPointsModel> myPointsModelFromJson(String str) => List<MyPointsModel>.from(json.decode(str).map((x) => MyPointsModel.fromJson(x)));

String myPointsModelToJson(List<MyPointsModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class MyPointsModel {
  final String ?mallId;
  final String ?mallName;
  final String ?mallImageUrl;
  final int ?points;
  final int ?pointValue;
  final int ?minimumOrderCostToWinPoint;

  MyPointsModel({
    this.mallId,
    this.mallName,
    this.mallImageUrl,
    this.points,
    this.pointValue,
    this.minimumOrderCostToWinPoint,
  });

  factory MyPointsModel.fromJson(Map<String, dynamic> json) => MyPointsModel(
    mallId: json["mallId"],
    mallName: json["mallName"],
    mallImageUrl: json["mallImageUrl"],
    points: json["points"],
    pointValue: json["pointValue"],
    minimumOrderCostToWinPoint: json["minimumOrderCostToWinPoint"],
  );

  Map<String, dynamic> toJson() => {
    "mallId": mallId,
    "mallName": mallName,
    "mallImageUrl": mallImageUrl,
    "points": points,
    "pointValue": pointValue,
    "minimumOrderCostToWinPoint": minimumOrderCostToWinPoint,
  };
}

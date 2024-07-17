// To parse this JSON data, do
//
//     final getMollDetailsModel = getMollDetailsModelFromJson(jsonString);

import 'dart:convert';

GetMollDetailsModel getMollDetailsModelFromJson(String str) => GetMollDetailsModel.fromJson(json.decode(str));

String getMollDetailsModelToJson(GetMollDetailsModel data) => json.encode(data.toJson());

class GetMollDetailsModel {
  final String ?id;
  final String ?name;
  final String ?location;
  final String ?phoneNumber;
  final dynamic ?evaluation;
  final String ?imageUrl;
  final List<String> ?subImageUrls;
  final MallOffer ?mallOffer;
  final List<Ad> ?ads;

  GetMollDetailsModel({
    this.id,
    this.name,
    this.location,
    this.phoneNumber,
    this.evaluation,
    this.imageUrl,
    this.subImageUrls,
    this.mallOffer,
    this.ads,
  });

  factory GetMollDetailsModel.fromJson(Map<String, dynamic> json) => GetMollDetailsModel(
    id: json["id"],
    name: json["name"],
    location: json["location"],
    phoneNumber: json["phoneNumber"],
    evaluation: json["evaluation"],
    imageUrl: json["imageUrl"],
    subImageUrls: List<String>.from(json["subImageUrls"].map((x) => x)),
    mallOffer: MallOffer.fromJson(json["mallOffer"]==null?{}:json["mallOffer"]),
    // ads: List<Ad>.from((json["ads"]==[]).map((x) => Ad.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "location": location,
    "phoneNumber": phoneNumber,
    "evaluation": evaluation,
    "imageUrl": imageUrl,
    "subImageUrls": List<dynamic>.from((subImageUrls??[]).map((x) => x)),
    "mallOffer": mallOffer?.toJson(),
    // "ads": List<dynamic>.from((ads??[]).map((x) => x.toJson())),
  };
}

class Ad {
  final String ?id;
  final String ?name;
  final String ?imageUrl;
  final String ?description;
  final DateTime ?endDate;

  Ad({
    this.id,
    this.name,
    this.imageUrl,
    this.description,
    this.endDate,
  });

  factory Ad.fromJson(Map<String, dynamic> json) => Ad(
    id: json["id"],
    name: json["name"],
    imageUrl: json["imageUrl"],
    description: json["description"],
    endDate: DateTime.parse(json["endDate"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "imageUrl": imageUrl,
    "description": description,
    "endDate": endDate?.toIso8601String(),
  };
}

class MallOffer {
  final String ?id;
  final String ?name;
  final String ?type;
  final int ?value;
  final DateTime ?startDate;
  final DateTime ?endDate;

  MallOffer({
    this.id,
    this.name,
    this.type,
    this.value,
    this.startDate,
    this.endDate,
  });

  factory MallOffer.fromJson(Map<String, dynamic> json) => MallOffer(
    id: json["id"],
    name: json["name"],
    type: json["type"],
    value: json["value"],
    startDate: DateTime.parse(json["startDate"]==null?"${DateTime.now()}":json["startDate"]),
    endDate: DateTime.parse(json["endDate"]==null?"${DateTime.now()}":json["endDate"]),
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

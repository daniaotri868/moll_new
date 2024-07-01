// To parse this JSON data, do
//
//     final getMollModel = getMollModelFromJson(jsonString);

import 'dart:convert';

GetMollModel getMollModelFromJson(String str) => GetMollModel.fromJson(json.decode(str));

String getMollModelToJson(GetMollModel data) => json.encode(data.toJson());

class GetMollModel {
  final int ?count;
  final List<Mall> ?malls;

  GetMollModel({
    this.count,
    this.malls,
  });

  factory GetMollModel.fromJson(Map<String, dynamic> json) => GetMollModel(
    count: json["count"],
    malls: List<Mall>.from(json["malls"].map((x) => Mall.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "count": count,
    "malls": List<dynamic>.from((malls??[]).map((x) => x.toJson())),
  };
}

class Mall {
  final String ?id;
  final String ?name;
  final String ?imageUrl;
  final List<String> ?subImageUrls;
  final dynamic ?evaluation;

  Mall({
    this.id,
    this.name,
    this.imageUrl,
    this.subImageUrls,
    this.evaluation,
  });

  factory Mall.fromJson(Map<String, dynamic> json) => Mall(
    id: json["id"],
    name: json["name"],
    imageUrl: json["imageUrl"],
    subImageUrls: List<String>.from(json["subImageUrls"].map((x) => x)),
    evaluation: json["evaluation"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "imageUrl": imageUrl,
    "subImageUrls": List<dynamic>.from((subImageUrls??[]).map((x) => x)),
    "evaluation": evaluation,
  };
}

// To parse this JSON data, do
//
//     final getMyProfileModel = getMyProfileModelFromJson(jsonString);

import 'dart:convert';

GetMyProfileModel getMyProfileModelFromJson(String str) => GetMyProfileModel.fromJson(json.decode(str));

String getMyProfileModelToJson(GetMyProfileModel data) => json.encode(data.toJson());

class GetMyProfileModel {
  final String ?id;
  final double ?wallet;
  final String ?firstName;
  final String ?lastName;
  final String ?email;
  final String ?phoneNumber;
  final String ?imageUrl;

  GetMyProfileModel({
    this.id,
    this.wallet,
    this.firstName,
    this.lastName,
    this.email,
    this.phoneNumber,
    this.imageUrl,
  });

  factory GetMyProfileModel.fromJson(Map<String, dynamic> json) => GetMyProfileModel(
    id: json["id"],
    wallet: double.parse("${json["wallet"]}"),
    firstName: json["firstName"],
    lastName: json["lastName"],
    email: json["email"],
    phoneNumber: json["phoneNumber"],
    imageUrl: json["imageUrl"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "wallet": wallet,
    "firstName": firstName,
    "lastName": lastName,
    "email": email,
    "phoneNumber": phoneNumber,
    "imageUrl": imageUrl,
  };
}

// To parse this JSON data, do
//
//     final homeModel = homeModelFromJson(jsonString);

import 'dart:convert';

HomeModel homeModelFromJson( str) => HomeModel.fromJson(str);

String homeModelToJson(HomeModel data) => json.encode(data.toJson());

class HomeModel {
  final List<Ad> ?ads;
  final List<ProductItem> ?products;
  final List<Mall> ?malls;

  HomeModel({
    this.ads,
    this.products,
    this.malls,
  });

  factory HomeModel.fromJson(Map<String, dynamic> json) => HomeModel(
    ads: List<Ad>.from(json["ads"].map((x) => Ad.fromJson(x))),
    products: List<ProductItem>.from(json["products"].map((x) => ProductItem.fromJson(x))),
    malls: List<Mall>.from(json["malls"].map((x) => Mall.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "ads": List<dynamic>.from((ads??[]).map((x) => x.toJson())),
    "products": List<dynamic>.from((products??[]).map((x) => x.toJson())),
    "malls": List<dynamic>.from((malls??[]).map((x) => x.toJson())),
  };
}

class Ad {
  final String ?id;
  final String ?name;
  final String ?imageUrl;
  final String ?description;
  final DateTime ?startDate;
  final DateTime ?endDate;
  final String ?mallId;
  final String ?mallName;

  Ad({
    this.id,
    this.name,
    this.imageUrl,
    this.description,
    this.startDate,
    this.endDate,
    this.mallId,
    this.mallName,
  });

  factory Ad.fromJson(Map<String, dynamic> json) => Ad(
    id: json["id"],
    name: json["name"],
    imageUrl: json["imageUrl"],
    description: json["description"],
    startDate: DateTime.parse(json["startDate"]),
    endDate: DateTime.parse(json["endDate"]),
    mallId: json["mallId"],
    mallName: json["mallName"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "imageUrl": imageUrl,
    "description": description,
    "startDate": startDate?.toIso8601String(),
    "endDate": endDate?.toIso8601String(),
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

class ProductItem {
  final String ?id;
  final String ?name;
  final String ?imageUrl;
  final bool? isFavourite;
  final int ?price;
  final int ?evaluation;

  ProductItem({
    this.id,
    this.name,
    this.imageUrl,
    this.isFavourite,
    this.price,
    this.evaluation,
  });

  factory ProductItem.fromJson(Map<String, dynamic> json) => ProductItem(
    id: json["id"],
    name: json["name"],
    imageUrl: json["imageUrl"],
    isFavourite: json["isFavourite"],
    price: json["price"],
    evaluation: json["evaluation"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "imageUrl": imageUrl,
    "isFavourite": isFavourite,
    "price": price,
    "evaluation": evaluation,
  };
}



class ProductCart {
  final String? id;
  final String? name;
  final int? qun;
  final int? offer;
  final int? price;
  final int? max;

  ProductCart({
    this.id,
    this.name,
    this.qun,
    this.offer,
    this.price,
    this.max,
  });

  ProductCart copyWith({
    String? id,
    String? name,
    int? qun,
    int? offer,
    int? price,
  }) {
    return ProductCart(
      id: id ?? this.id,
      name: name ?? this.name,
      qun: qun ?? this.qun,
      offer: offer ?? this.offer,
      price: price ?? this.price,
    );
  }
}
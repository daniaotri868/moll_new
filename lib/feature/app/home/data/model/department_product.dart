class GetAllDepartmentProductModel {
  final int ?count;
  late final List<ProductDp> ?products;

  GetAllDepartmentProductModel({
    this.count,
    this.products,
  });

  GetAllDepartmentProductModel copyWith({
    int ?count,
    List<ProductDp> ?products,
  }) {
    return GetAllDepartmentProductModel(
      count: count ?? this.count,
      products: products ?? this.products,
    );
  }

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
  final double ?Lng;
  final double ?Lat;
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
    this.Lat,
    this.Lng,
    this.quantity,
    this.imageUrl,
    this.evaluation,
    this.hasDiscount,
    this.mallId,
    this.priceAfterDiscount,
  });

  ProductDp copyWith({
    String ?id,
    String ?name,
    int ?price,
    int ?quantity,
    double ?Lng,
    double ?Lat,
    String ?imageUrl,
    String ?mallId,
    dynamic ?evaluation,
    bool ?hasDiscount,
    dynamic ?priceAfterDiscount,
  }) {
    return ProductDp(
      id: id ?? this.id,
      name: name ?? this.name,
      price: price ?? this.price,
      quantity: quantity ?? this.quantity,
      imageUrl: imageUrl ?? this.imageUrl,
      mallId: mallId ?? this.mallId,
      evaluation: evaluation ?? this.evaluation,
      hasDiscount: hasDiscount ?? this.hasDiscount,
      Lat: Lat ?? this.Lat,
      Lng: Lng ?? this.Lng,
      priceAfterDiscount: priceAfterDiscount ?? this.priceAfterDiscount,
    );
  }

  factory ProductDp.fromJson(Map<String, dynamic> json) => ProductDp(
    id: json["id"],
    name: json["name"],
    price: json["price"],
    quantity: json["quantity"],
    imageUrl: json["imageUrl"],
    Lng: json["lng"],
    Lat: json["lat"],
    evaluation: json["evaluation"],
    hasDiscount: json["hasDiscount"],
    mallId: json["mallId"],
    priceAfterDiscount: json["priceAfterDiscount"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "price": price,
    "lng": Lng,
    "lat": Lat,
    "quantity": quantity,
    "imageUrl": imageUrl,
    "evaluation": evaluation,
    "hasDiscount": hasDiscount,
    "mallId": mallId,
    "priceAfterDiscount": priceAfterDiscount,
  };
}
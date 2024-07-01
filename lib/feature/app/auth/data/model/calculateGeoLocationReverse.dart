class CalculateGeoLocationReverseModel {
  final String ?street;
  final String ?city;

  CalculateGeoLocationReverseModel({
    this.street,
    this.city,

  });

  factory CalculateGeoLocationReverseModel.fromJson(Map<String, dynamic> json) {

    return CalculateGeoLocationReverseModel(
      city: json['city'] ?? "",
      street: json['street'] ?? "",
    );
  }
}


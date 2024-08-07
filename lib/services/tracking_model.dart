import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class TrackingModel {
  final double lat;
  final double lng;
  final String id;
  final String customerId;
  TrackingModel({
    required this.lat,
    required this.lng,
    required this.id,
    required this.customerId,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'lat': lat,
      'lng': lng,
      'OrderId': id,
      'CustomerId': customerId,
    };
  }

  factory TrackingModel.fromMap(Map<String, dynamic> map) {
    return TrackingModel(
      lat: map['lat'] as double,
      lng: map['lng'] as double,
      id: map['OrderId'] as String,
      customerId: map['CustomerId'] as String,
    );
  }
}

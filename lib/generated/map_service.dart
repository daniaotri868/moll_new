// import 'dart:ui';
// import 'package:app_settings/app_settings.dart';
// import 'package:geocoding/geocoding.dart' hide Location;
// import 'package:geolocator/geolocator.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:location/location.dart';
//
// class MapService {
//   /// Determine the current position of the device.
//   ///
//   /// When the location services are not enabled or permissions
//   /// are denied the `Future` will return an error.
//   Future<Position> determinePosition() async {
//     bool serviceEnabled;
//     LocationPermission permission;
//
//     // Test if location services are enabled.
//     serviceEnabled = await Geolocator.isLocationServiceEnabled();
//     if (!serviceEnabled) {
//       // Location services are not enabled don't continue
//       // accessing the position and request users of the
//       // App to enable the location services.
//       return Future.error('Location services are disabled.');
//     }
//
//     permission = await Geolocator.checkPermission();
//     if (permission == LocationPermission.denied) {
//       permission = await Geolocator.requestPermission();
//       if (permission == LocationPermission.denied) {
//         // Permissions are denied, next time you could try
//         // requesting permissions again (this is also where
//         // Android's shouldShowRequestPermissionRationale
//         // returned true. According to Android guidelines
//         // your App should show an explanatory UI now.
//         return Future.error('Location permissions are denied');
//       }
//     }
//
//     if (permission == LocationPermission.deniedForever) {
//       // Permissions are denied forever, handle appropriately.
//       return Future.error('Location permissions are permanently denied, we cannot request permissions.');
//     }
//
//     // When we reach here, permissions are granted and we can
//     // continue accessing the position of the device.
//     return await Geolocator.getCurrentPosition();
//   }
//
//   Future<LocationData?> getLocation({VoidCallback? onDeniedForEver}) async {
//     try {
//       Location location = Location();
//       bool serviceEnabled;
//       PermissionStatus permissionGranted;
//       LocationData locationData;
//
//       serviceEnabled = await location.serviceEnabled();
//       if (!serviceEnabled) {
//         serviceEnabled = await location.requestService();
//       }
//
//       if (!serviceEnabled) {
//         throw Exception("_serviceEnabled result: false");
//       }
//
//       permissionGranted = await location.hasPermission();
//       if (permissionGranted == PermissionStatus.denied) {
//         permissionGranted = await location.requestPermission();
//
//         if (permissionGranted == PermissionStatus.deniedForever) {
//           if (onDeniedForEver != null) {
//             onDeniedForEver.call();
//           } else {
//             await AppSettings.openAppSettings(type: AppSettingsType.location);
//           }
//         }
//
//         if (permissionGranted != PermissionStatus.granted) {
//           throw Exception("PermissionStatus result: denied");
//         }
//       }
//       locationData = await location.getLocation();
//
//       return locationData;
//     } catch (d) {
//       return null;
//     }
//   }
//
//   Future<Placemark?> getPlacemark(LatLng latLng) async {
//     List<Placemark> placemarks = await placemarkFromCoordinates(latLng.latitude, latLng.longitude);
//     if (placemarks.isEmpty) {
//       return null;
//     }
//     return placemarks.first;
//   }
// }

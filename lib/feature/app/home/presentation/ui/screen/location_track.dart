import 'package:app_settings/app_settings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:location_platform_interface/location_platform_interface.dart';

class LocationTrack extends StatefulWidget {
  double lng;
  double lat;
   LocationTrack({super.key,required this.lat,required this.lng});

  @override
  State<LocationTrack> createState() => _LocationTrackState();
}

class _LocationTrackState extends State<LocationTrack> {
  @override
  Location _locationController = new Location();

  late GoogleMapController googleMapController;
  ValueNotifier<LatLng?> currentP = ValueNotifier(null);
  Map<PolylineId, Polyline> polylines = {};
  List<LatLng> polylineCoordinates = [];
  LatLng mollLocation=LatLng(37.42796133580664, -122.085749655962);
  PolylinePoints polylinePoints = PolylinePoints();
  BitmapDescriptor sourceIcon = BitmapDescriptor.defaultMarker;
  BitmapDescriptor destinationIcon = BitmapDescriptor.defaultMarker;
  void setCustomMarkerIcon() {
    BitmapDescriptor.fromAssetImage(
        ImageConfiguration.empty, 'assets/image/moll.png')
        .then((icon) {
      destinationIcon = icon;
    });
    BitmapDescriptor.defaultMarker;
  }
  void initState() {
    getLocatoinUpdate();
    _getPolyline();
    // TODO: implement initState
    super.initState();

  }
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
          onTap: (argument) {
            print("${polylineCoordinates.length}");
          },
          initialCameraPosition: CameraPosition(
            target: LatLng(currentP.value?.latitude??0.0, currentP.value?.longitude??0.0),
            zoom: 15,
          ),
          myLocationButtonEnabled: false,
          zoomControlsEnabled: false,
          // mapType: MapType.normal,
          markers: {
            Marker(
                markerId: const MarkerId('storeLocation'),
                infoWindow: const InfoWindow(
                    title: 'Store', snippet: "store location"),
                icon: sourceIcon,
                position: LatLng(widget.lat??0.0, widget.lng??0.0)),
            Marker(
                markerId: const MarkerId('UserLocation'),
                infoWindow: const InfoWindow(
                    title: 'User', snippet: "User location"),
                icon: destinationIcon,
                position: LatLng(currentP.value?.latitude??0.0, currentP.value?.longitude??0.0)),

          },
          polylines: Set<Polyline>.of(polylines.values)
        // onLongPress: _addMarker,
      ),
    );
  }
  _addPolyLine() {
    PolylineId id = PolylineId("poly");
    Polyline polyline = Polyline(
        polylineId: id, color: Colors.red, points: polylineCoordinates);
    polylines[id] = polyline;
    setState(() {
      print("=========================${polylines.length}");
    });
  }
    _getPolyline() async {
    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
      googleApiKey: "AIzaSyD2dcs9zzNRVjyiJ9MehLLAErdDX0v5wJ4",
      request: PolylineRequest(
        origin: PointLatLng(currentP.value?.latitude??0 ,currentP.value?.longitude??0 ),
        destination: PointLatLng(mollLocation.latitude ,mollLocation.longitude ),
        mode: TravelMode.driving,
        wayPoints: [PolylineWayPoint(location: "Sabo, Yaba Lagos Nigeria")],
      ),
    );
    // if (result.points.isNotEmpty) {
    print("result=${result}");
      result.points.forEach((PointLatLng point) {
        polylineCoordinates.add(LatLng(point.latitude, point.longitude));
      });
    // }
    _addPolyLine();
  }
  Future<void> getLocatoinUpdate() async {
    bool _serviceEnable;
    PermissionStatus _permissionGranted;
    _serviceEnable = await _locationController.serviceEnabled();
    if (_serviceEnable) {
      _serviceEnable = await _locationController.requestService();
    } else {
      return;
    }
    _permissionGranted = await _locationController.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await _locationController.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        currentP.value = const LatLng(36.22366954, 37.1296072);
        return;
      }
    }

    final location = await _locationController.getLocation();
    if (location.latitude == null || location.longitude == null) return;

    if (!mounted) return;

    currentP.value = LatLng(location.latitude!, location.longitude!);
    Position? position = await _determinePosition();
    // context.read<AuthBloc>().add(CalculateGeoEvent(
    //     position?.latitude.toString() ?? "",
    //     position?.longitude.toString() ?? ""));
  }

  Future<Position?> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    Location location = Location();
    if (!serviceEnabled) {
      final resultRequestService = await location.requestService();
      if (!resultRequestService) {
        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text("تحتاج الى تفعيل الموقع")));
        }
        return null;
      }
    }

    permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();

      if (permission == LocationPermission.denied) {
        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text("نحتاج الى الوصول الى موقعك ")));
        }
        return null;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      AppSettings.openAppSettings(type: AppSettingsType.location);
      return null;
    }

    Position position = await Geolocator.getCurrentPosition();
    return position;
  }
}

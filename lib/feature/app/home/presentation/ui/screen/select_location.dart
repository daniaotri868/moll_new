
import 'dart:math';

import 'package:app_settings/app_settings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geolocator/geolocator.dart';
import 'package:go_router/go_router.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:remy/core/utils/extensions/build_context.dart';
import 'package:remy/feature/app/home/presentation/bloc/auth_bloc.dart';

import '../../../../presentation/widgets/app_scaffold.dart';
import '../../../../presentation/widgets/app_text.dart';
import '../widget/nav_location.dart';



class LocationPage extends StatefulWidget {
  static LatLng selectLocation= LatLng(37.42796133580664, -122.085749655962);
  static double distance= 0;
  static const name = "locationPage";
  static const path = "locationPage";
  const LocationPage({Key? key}) : super(key: key);

  @override
  _LocationPageState createState() => _LocationPageState();
}

class _LocationPageState extends State<LocationPage> {
  late GoogleMapController googleMapController;

  // static const CameraPosition initialCameraPosition = CameraPosition(
  //   // target: LatLng(37.42796133580664, -122.085749655962),
  //   zoom: 15,
  // );
  Location _locationController = new Location();
  ValueNotifier<LatLng?> currentP = ValueNotifier(null);
  Set<Marker> markers = {};
  double? lat;
  double? long;
  PolylinePoints polylinePoints = PolylinePoints();
  Map<PolylineId, Polyline> polylines = {}; //polylines to show direction

  // LatLng startLocation = LatLng(27.6683619, 85.3101895);
  // LatLng endLocation = LatLng(27.6875436, 85.2751138);

  double distance = 0.0;
  @override
  void initState() {
    getLocatoinUpdate();
    getDirections();
    super.initState();
  }
  getDirections() async {
    List<LatLng> polylineCoordinates = [];
    print(currentP.value?.latitude??0);
    print(currentP.value?.longitude??0);
    print(context.read<HomeBloc>().state.listCart?[0].Lat??0);
    print(context.read<HomeBloc>().state.listCart?[0].Lng??0);
    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
      googleApiKey: "AIzaSyD2dcs9zzNRVjyiJ9MehLLAErdDX0v5wJ4",
      request: PolylineRequest(
        origin: PointLatLng(currentP.value?.latitude??0, currentP.value?.longitude??0),
        destination: PointLatLng(context.read<HomeBloc>().state.listCart?[0].Lat??0, context.read<HomeBloc>().state.listCart?[0].Lng??0),
        mode: TravelMode.driving,
        wayPoints: [PolylineWayPoint(location: "Sabo, Yaba Lagos Nigeria")],
      ),
    );







      //   .getRouteBetweenCoordinates(
      // request:PolylineRequest(origin: PointLatLng(currentP.value?.latitude??0, currentP.value?.longitude??0),
      //     destination: PointLatLng(context.read<HomeBloc>().state.listCart?[0].Lat??0, context.read<HomeBloc>().state.listCart?[0].Lng??0), mode: TravelMode.driving,
      //
      // ) ,
    // );

    if (result.points.isNotEmpty) {
      print("object");

      result.points.forEach((PointLatLng point) {
        polylineCoordinates.add(LatLng(point.latitude, point.longitude));
      });
    } else {
      print(result.errorMessage);
    }

    //polulineCoordinates is the List of longitute and latidtude.
    double totalDistance = 0;
    for(var i = 0; i < polylineCoordinates.length-1; i++){
      totalDistance += calculateDistance(
          polylineCoordinates[i].latitude,
          polylineCoordinates[i].longitude,
          polylineCoordinates[i+1].latitude,
          polylineCoordinates[i+1].longitude);
    }
    print(totalDistance);

    setState(() {
      LocationPage.distance = totalDistance;
    });

    //add to the list of poly line coordinates
    addPolyLine(polylineCoordinates);
  }

  addPolyLine(List<LatLng> polylineCoordinates) {
    PolylineId id = PolylineId("poly");
    Polyline polyline = Polyline(
      polylineId: id,
      color: Colors.deepPurpleAccent,
      points: polylineCoordinates,
      width: 8,
    );
    polylines[id] = polyline;
    setState(() {});
  }

  double calculateDistance(lat1, lon1, lat2, lon2){
    var p = 0.017453292519943295;
    var a = 0.5 - cos((lat2 - lat1) * p)/2 +
        cos(lat1 * p) * cos(lat2 * p) *
            (1 - cos((lon2 - lon1) * p))/2;
    return 12742 * asin(sqrt(a));
  }
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
  builder: (context, state) {

    return AppScaffold(
      extendBody: true,
      appBar: AppBar(
        toolbarHeight: 90.h,
        centerTitle: true,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            40.horizontalSpace,
            // AppImage.asset('assets/images/location_icon.png'),
            // 10.horizontalSpace,
            AppText("تحديد الموقع"),
          ],
        ),
      ),
      body: ValueListenableBuilder(
        valueListenable: currentP,
        builder: (context, value, child) {
          return value == null
              ? Center(
            child: AppText(
              'loading...',
            ),
          )
              : GoogleMap(
            initialCameraPosition: CameraPosition(
              target: currentP.value!,
              zoom: 13,
            ),
            mapType: MapType.normal,
            markers: {
              Marker(
                markerId: const MarkerId('currentLocatoin'),
                icon: BitmapDescriptor.defaultMarker,
                position: value,
              ),
              Marker(
                markerId: const MarkerId('currentLocatoin'),
                icon: BitmapDescriptor.defaultMarker,
                position: LatLng(context.read<HomeBloc>().state.listCart?[0].Lat??0, context.read<HomeBloc>().state.listCart?[0].Lng??0),
              ),
            },
              polylines: Set<Polyline>.of(polylines.values)
            ,
            onTap: (argument) {

              //  PointLatLng(currentP.value?.latitude??0, currentP.value?.longitude??0),
              // destination: PointLatLng(context.read<HomeBloc>().state.listCart?[0].Lat??0, context.read<HomeBloc>().state.listCart?[0].Lng??0),
              print("---------${LocationPage.distance}");
             setState(() {
               currentP.value = argument;
             });
              // context.read<HomeBloc>().add(CalculateGeoEvent(
              //     currentP.value!.latitude.toString(),
              //     currentP.value!.longitude.toString()));
              // print(argument);
            },
          );
        },
      ),
      floatingActionButton:  FloatingActionButton(
        heroTag: "btn2",
        backgroundColor: context.colorScheme.primary,
        shape: const CircleBorder(),
        onPressed: getLocatoinUpdate,
        child: const Icon(Icons.my_location_sharp),
      ),
      bottomNavigationBar: NavLocationPage(
        onPressed: () {
          LocationPage.selectLocation=currentP.value?? LatLng(37.42796133580664, -122.085749655962);
          context.pop();
          // context.pushNamed(
          //   DetailsLocation.name,
          //   extra: currentP.value,
          // );
        },
        title: "",
        subTitle: "",
      ),
    );
  },
);
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
        // currentP.value = const LatLng(36.22366954, 37.1296072);
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

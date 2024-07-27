import 'package:app_settings/app_settings.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:json_serializable/type_helper.dart';
import 'package:location/location.dart';
import 'package:location_platform_interface/location_platform_interface.dart';
import 'package:remy/core/utils/extensions/build_context.dart';
import 'package:remy/feature/app/home/presentation/bloc/auth_bloc.dart';
import 'package:remy/feature/app/presentation/widgets/app_text.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../../../common/constants/route.dart';
import '../../../../../../common/models/page_state/result_builder.dart';
import '../../../../auth/presentation/ui/screen/login_screen.dart';
import '../../../../presentation/pages/empty_screen.dart';
import '../../../../presentation/pages/error_screen.dart';
import '../../../../presentation/pages/loading_screen.dart';
import '../../../../presentation/widgets/app_elvated_button.dart';
import '../../../domain/use_case/department_details_use_case.dart';

class DetailsMall extends StatefulWidget {
  static String name="DetailsMull";
  final String idMall;
  const DetailsMall({super.key,required this.idMall});

  @override
  State<DetailsMall> createState() => _DetailsMallState();
}

class _DetailsMallState extends State<DetailsMall> {
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
    // TODO: implement initState
    super.initState();
    getLocatoinUpdate();
    _getPolyline();
    print("ggggggggggggggg");
    context.read<HomeBloc>().add(MollDetailsEvent(detailsParams: DetailsParams(id: widget.idMall,userId: LoginScreen.userId)));
  }
  @override
  final CarouselController _controller = CarouselController();
  int activeIndex = 0;
  int q=1;

  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        return PageStateBuilder(
          success: (data) {
              mollLocation=LatLng(data.lat??0, data.lng??0);
            return Scaffold(
              body:  Column(
                children: [
                  CarouselSlider.builder(
                    carouselController: _controller,
                    itemCount: data.subImageUrls?.length ?? 1,
                    options: CarouselOptions(
                      aspectRatio: 3 / 2,
                      padEnds: false,
                      viewportFraction: 1,
                      enableInfiniteScroll: false,
                      onPageChanged: (index, reason) => setState(
                            () {
                          // print(widget.images.length);
                          activeIndex = index;
                        },
                      ),
                    ),
                    itemBuilder: (BuildContext context, int index, int realIndex) =>
                        Stack(
                          children: [
                            Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                        bottomRight: Radius.circular(16.r),
                                        bottomLeft: Radius.circular(16.r))),
                                child: ClipRRect(
                                    borderRadius: BorderRadius.only(
                                        bottomRight: Radius.circular(16.r),
                                        bottomLeft: Radius.circular(16.r)),
                                    child: FancyShimmerImage(
                                      errorWidget: const Center(
                                        child: Icon(
                                          Icons.image_not_supported,
                                          size: 30,
                                        ),
                                      ),
                                      imageUrl: "${EndPoints.address}/${data.subImageUrls?[index] ?? ""}",
                                      boxFit: BoxFit.cover,
                                      width: double.infinity,
                                    ))),
                            Padding(
                              padding: REdgeInsets.only(top: 270,right: 170),
                              child: Container(
                                margin: REdgeInsets.only(bottom: 17.h),
                                child: AnimatedSmoothIndicator(
                                  activeIndex: activeIndex,
                                  count: data.subImageUrls?.length ?? 0,
                                  effect: ExpandingDotsEffect(
                                    dotColor: Colors.grey,
                                    activeDotColor: context.colorScheme.primary,
                                    dotHeight: 10.h,
                                    dotWidth: 10.w,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                  ),

                  Expanded(
                    child: Container(
                      width: double.infinity,
                      padding: REdgeInsetsDirectional.all(10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(30),
                              topRight: Radius.circular(30)
                          ),
                          color:Color(0xffF3F2FE)
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          30.verticalSpace,
                          AppText(data.name??"", style: context.textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w700),),
                          30.verticalSpace,
                          AppText("رقم الهاتف: ${data.phoneNumber}", style: context.textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w700),),
                          20.verticalSpace,
                          Row(
                            children: [
                              RatingBar.builder(
                                initialRating: double.tryParse("${data.evaluation}")??0.0,
                                minRating: 1,
                                direction: Axis.horizontal,
                                allowHalfRating: false,
                                itemCount: 5,
                                itemSize: 20.0,
                                itemBuilder: (context, _) => const Icon(
                                  Icons.star,
                                  color: Colors.amber,
                                ),
                                ignoreGestures: true,
                                onRatingUpdate: (rating) {
                                  print(rating);
                                },
                              ),
                              AppText(data.evaluation==null?"0":data.evaluation, style: context.textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w700),),
                            ],
                          ),
                          30.verticalSpace,
                          Row(
                            children: [
                              Column(
                                children: [
                                  // if(data.offer?.priceAfterDiscount!=0)AppText(data.price.toString()??"", style: context.textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w700,  decoration: TextDecoration.lineThrough,),),
                                  // AppText((data.offer?.priceAfterDiscount!=0)?data.offer?.priceAfterDiscount.toString()??"":data.price.toString()??"", style: context.textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w700),),

                                ],
                              ),
                              20.horizontalSpace,


                            ],
                          ),

                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 300,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white
                      ),
                      child: GoogleMap(
                          initialCameraPosition: CameraPosition(
                            target: LatLng(currentP.value?.latitude??0.0, currentP.value?.longitude??0.0),
                            zoom: 15,
                          ),
                          myLocationButtonEnabled: false,
                          zoomControlsEnabled: false,
                          mapType: MapType.normal,
                          markers: {
                            Marker(
                                markerId: const MarkerId('storeLocation'),
                                infoWindow: const InfoWindow(
                                    title: 'Store', snippet: "store location"),
                                icon: sourceIcon,
                                position: LatLng(data.lat??0.0, data.lng??0.0)),
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
                    ),
                  )

                ],
              ),

            );
          },
          result: state.getMollDetails,
          loading: Scaffold(body: LoadingScreen(),),
          error: (error) => Scaffold(
            body: ErrorScreen(
              onRefresh: () {
                context.read<HomeBloc>().add(ProductDetailsEvent(detailsParams: DetailsParams(id: widget.idMall,userId: LoginScreen.userId)));
              },
            ),
          ),
          empty: Scaffold(body: EmptyScreen(),),
          init: Scaffold(body: Container(),),
        );
      },
    );
  }
  _addPolyLine() {
    PolylineId id = PolylineId("poly");
    Polyline polyline = Polyline(
        polylineId: id, color: Colors.red, points: polylineCoordinates);
    polylines[id] = polyline;
    setState(() {});
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
    if (result.points.isNotEmpty) {
      result.points.forEach((PointLatLng point) {
        polylineCoordinates.add(LatLng(point.latitude, point.longitude));
      });
    }
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

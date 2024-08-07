
import 'package:app_settings/app_settings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:geolocator/geolocator.dart';
import 'package:go_router/go_router.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:remy/core/utils/extensions/build_context.dart';
import 'package:remy/feature/app/presentation/pages/empty_screen.dart';
import 'package:remy/feature/app/presentation/widgets/app_text.dart';
import '../../../../../../common/helpers/helper_functions.dart';
import '../../../../../../core/utils/responsive_padding.dart';
import '../../../../auth/presentation/ui/screen/login_screen.dart';
import '../../../../presentation/pages/error_screen.dart';
import '../../../../presentation/widgets/animated_dialog.dart';
import '../../../../presentation/widgets/app_elvated_button.dart';
import '../../../../presentation/widgets/app_scaffold.dart';
import '../../../../presentation/widgets/app_text_field.dart';
import '../../../domain/use_case/cancel_order.dart';
import '../../../domain/use_case/new_rate_order.dart';
import '../../../domain/use_case/order_details.dart';
import '../../bloc/auth_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../widget/item_order.dart';
import 'location_track.dart';


class OrderDetailsPage extends StatefulWidget {
  const OrderDetailsPage({super.key, required this.orderDetailsParam});

  static const path = "orderDetails";
  static const name = "orderDetails";
  final OrderDetailsParams orderDetailsParam;

  @override
  State<OrderDetailsPage> createState() => _OrderDetailsPageState();
}

class _OrderDetailsPageState extends State<OrderDetailsPage> {
  @override
  double rate=0;
  double rateDriver=0;
  TextEditingController password =TextEditingController();
  TextEditingController rateDriverReason =TextEditingController();
  TextEditingController rateOrderReason =TextEditingController();

  void initState() {

    context
        .read<HomeBloc>()
        .add(GetOrderDetailsEvent(orderDetailsParams: OrderDetailsParams(id:widget.orderDetailsParam.id,userId:LoginScreen.userId )));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      backgroundColor: context.colorScheme.onPrimary,
      appBar: AppBar(
        title: Text("تفاصيل الطلب"),
        centerTitle: true,
      ),
      body: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          return state.orderDetails.when(
            init: () => Container(),
            loading: () => const Center(
              child: CircularProgressIndicator(),
            ),
            loaded: (data) => Padding(
              padding: REdgeInsetsDirectional.all(15),
              child: ListView(
                // crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  RichText(
                    text: TextSpan (
                      text: 'رقم الطلب :  ',
                      style: context.textTheme.titleMedium!.copyWith(
                          color: Colors.black.withOpacity(0.5)),
                      children: [
                        TextSpan(
                          text: data.number,
                          style: context.textTheme.bodyMedium!.copyWith(
                            color: Colors.black.withOpacity(0.5),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  10.verticalSpace,
                  Row(
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'العنوان : ',
                        style: context.textTheme.titleMedium!.copyWith(
                          color: Colors.black.withOpacity(0.5),
                        ),
                      ),
                      RichText(
                        text: TextSpan(
                          text: data.areaName,
                          style: context.textTheme.titleSmall!.copyWith(
                            color: Colors.black.withOpacity(0.5),
                          ),
                        ),
                      ),
                    ],
                  ),
                  10.verticalSpace,
                  Row(
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'المول : ',
                        style: context.textTheme.titleMedium!.copyWith(
                          color: Colors.black.withOpacity(0.5),
                        ),
                      ),
                      RichText(
                        text: TextSpan(
                          text: data.mallName,
                          style: context.textTheme.titleSmall!.copyWith(
                            color: Colors.black.withOpacity(0.5),
                          ),
                        ),
                      ),
                    ],
                  ),
                  10.verticalSpace,
                  Row(
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'عدد النقاط المستخدمة : ',
                        style: context.textTheme.titleMedium!.copyWith(
                          color: Colors.black.withOpacity(0.5),
                        ),
                      ),
                      RichText(
                        text: TextSpan(
                          text: data.usedPoints.toString(),
                          style: context.textTheme.titleSmall!.copyWith(
                            color: Colors.black.withOpacity(0.5),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Divider(),
                  10.verticalSpace,
                  Row(
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'التكلفة : ',
                        style: context.textTheme.titleMedium!.copyWith(
                          color: Colors.black.withOpacity(0.5),
                        ),
                      ),
                      6.horizontalSpace,

                      Text(
                       "${data.totalCost}",
                        style: context.textTheme.titleSmall!.copyWith(
                            color: Colors.black.withOpacity(0.5)),
                      )
                    ],
                  ),
                  10.verticalSpace,
                  Row(
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'سعر التوصيل : ',
                        style: context.textTheme.titleMedium!.copyWith(
                          color: Colors.black.withOpacity(0.5),
                        ),
                      ),
                      6.horizontalSpace,

                      Text(
                       "${data.deliveryCost??0}",
                        style: context.textTheme.titleSmall!.copyWith(
                            color: Colors.black.withOpacity(0.5)),
                      )
                    ],
                  ),
                  10.verticalSpace,
                  Row(
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'الإجمالي  :',
                        style: context.textTheme.titleMedium!.copyWith(
                          color: Colors.black.withOpacity(0.5),
                        ),
                      ),
                      6.horizontalSpace,
                      Text(
                        '${HelperFunctions.formatPrice(data.finalCost??0)} ل.س ',
                        style: context.textTheme.titleMedium!
                            .copyWith(color: Colors.black.withOpacity(0.5)),
                      )
                    ],
                  ),
                  10.verticalSpace,
                  SizedBox(
                    height: data.products?.length == 2 || data.products?.length == 1
                        ? 200
                        : 300.h,
                    child: ListView.builder(
                      itemBuilder: (context, index) => ItemOrder(
                        padding: true,
                        item: data.products![index],
                      ),
                      itemCount: data.products?.length,
                    ),
                  ),
                  10.verticalSpace,
                  Row(
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'ملاحظات  :',
                        style: context.textTheme.titleMedium!.copyWith(
                          color: Colors.black.withOpacity(0.5),
                        ),
                      ),
                      6.horizontalSpace,
                      Text(
                        "لا يوجد",
                        style: context.textTheme.titleMedium!
                            .copyWith(color: Colors.black.withOpacity(0.5)),
                      )
                    ],
                  ),
                  10.verticalSpace,
                  widget.orderDetailsParam.cancel==0?ElevatedButton(onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) =>LocationTrack(
                      lat:data.lat??0.0 ,lng: data.lng??0.0,mallLat: data.mallLat??0,mallLng: data.mallLng??0,) ,));
                  }, child: AppText("تتبع الطلب",)):Container(),
                10.verticalSpace,
                 data.status=="Done"? ElevatedButton(onPressed: () {
                    AnimatedDialog.show(
                      context,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),

                          ),
                          height: 330,
                          width: 125,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  AppText("تقييم الطلب"),
                                ],
                              ),
                              RatingBar.builder(
                                initialRating: 0.0,
                                minRating: 1,
                                direction: Axis.horizontal,
                                allowHalfRating: true,
                                itemCount: 5,
                                itemSize: 20.0,
                                updateOnDrag: true,

                                itemBuilder: (context, _) => const Icon(
                                  Icons.star,
                                  color: Colors.amber,
                                ),
                                ignoreGestures: false,
                                onRatingUpdate: (rating) {
                                  setState(() {
                                    rate=rating;
                                  });
                                  print(rating);
                                },
                              ),
                              10.verticalSpace,
                              AppTextField(
                                name: "password",
                                title: ":السبب",
                                obscure: true,
                                validator: FormBuilderValidators.required(),
                                controller: rateOrderReason,
                                // isPasswordFiled: true,
                                // prefixIcon: Icon(
                                //   Icons.lock,
                                //   color: context.colorScheme.primary,
                                // ),
                              ),
                              Divider(),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  AppText("تقييم السائق"),
                                ],
                              ),
                              RatingBar.builder(
                                initialRating: 0.0,
                                minRating: 1,
                                direction: Axis.horizontal,
                                allowHalfRating: true,
                                itemCount: 5,
                                itemSize: 20.0,
                                updateOnDrag: true,

                                itemBuilder: (context, _) => const Icon(
                                  Icons.star,
                                  color: Colors.amber,
                                ),
                                ignoreGestures: false,
                                onRatingUpdate: (rating) {
                                  setState(() {
                                    rateDriver=rating;
                                  });
                                  print(rating);
                                },
                              ),
                              10.verticalSpace,
                              AppTextField(
                                name: "password",
                                title: ":السبب",
                                obscure: true,
                                validator: FormBuilderValidators.required(),
                                controller: rateDriverReason,
                                // isPasswordFiled: true,
                                // prefixIcon: Icon(
                                //   Icons.lock,
                                //   color: context.colorScheme.primary,
                                // ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: AppElevatedButton(
                                    isLoading: state.newRate.isLoading()
                                          ,onPressed: () {
                                        context.read<HomeBloc>().add(
                                            NewRateOrderEvent(
                                            newRateOrderParams:NewRateOrderParams(
                                              id:data.id??"" ,
                                              userId:LoginScreen.userId ,
                                              reasonOrder: rateDriverReason.text??"",
                                              rateOrder:rate??0 ,
                                                rateDriver:rateDriver??0 ,
                                              reason: rateOrderReason.text??"",

                                            ) ,
                                              onSuccess: () {
                                                context.pop();
                                                Fluttertoast.showToast(
                                                    msg: "تم التقييم",
                                                    toastLength: Toast.LENGTH_SHORT,
                                                    gravity: ToastGravity.BOTTOM,
                                                    timeInSecForIosWeb: 1,
                                                    backgroundColor:  Colors.black,
                                                    textColor: Colors.white,
                                                    fontSize: 16.0);
                                                // context.goNamed('/home');
                                              },
                                            )
                                        );

                                      }, child: AppText("نعم")),
                                    ),
                                    8.horizontalSpace,
                                    Expanded(
                                      child: ElevatedButton(onPressed: () {
                                        context.pop();

                                      }, child: AppText("لا")),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      backgroundColor: context.colorScheme.onPrimary,
                      insetPadding: HWEdgeInsets.symmetric(horizontal: 30, vertical: 16),
                    );
                  }, child: AppText("تقييم الطلبية",)):Container(),
                10.verticalSpace,
                 widget.orderDetailsParam.cancel==2? ElevatedButton(onPressed: () {
                   AnimatedDialog.show(
                       context,
                     child: Container(
                       height: 230,
                       width: 125,
                       child: Padding(
                         padding: const EdgeInsets.all(8.0),
                         child: Column(
                           children: [
                             20.verticalSpace,
                             AppTextField(
                               name: "password",
                               title: ":السبب",
                               obscure: true,
                               validator: FormBuilderValidators.required(),
                               controller: password,
                               // isPasswordFiled: true,
                               // prefixIcon: Icon(
                               //   Icons.lock,
                               //   color: context.colorScheme.primary,
                               // ),
                             ),
                             30.verticalSpace,
                             Padding(
                               padding: const EdgeInsets.all(8.0),
                               child: Column(
                                 children: [
                                   AppElevatedButton(

                                       onPressed: () {
                                     context.read<HomeBloc>().add(CancelOrderEvent(
                                         confirmOrderParams: CancelOrderParams(
                                             userId: LoginScreen.userId,
                                             id: widget.orderDetailsParam.id,
                                             reason: password.text

                                         ), onSuccess: () {
                                          context.pop();
                                     }
                                     ));
                                   },isLoading: state.cancel.isLoading(), child: AppText("تأكيد")),
                                 ],
                               ),
                             )
                           ],
                         ),
                       ),
                     )
                   );
                  }, child: AppText("إلغاء الطلبية",)):Container(),


                  // !widget.orderDetailsParam.orderType
                  //     ? const SizedBox.shrink()
                  //     : state.orders.data.firstWhereOrNull((element) =>
                  //                 element.id ==
                  //                 widget.orderDetailsParam.id) ==
                  //             null
                  //         ? const SizedBox.shrink()
                  //         : RPadding(
                  //             padding: const EdgeInsets.only(top: 10),
                  //             child: AppElevatedButton(
                  //               onPressed: () => context.pushNamed(
                  //                   OrderTrackingPage.name,
                  //                   extra: widget.orderDetailsParam.id),
                  //               text: "تتبع الطلبية",
                  //             ),
                  //           )
                ],
              ),
            ),
            empty: () => const EmptyScreen(),
            error: (exception, message) => ErrorScreen(
              onRefresh: () {
                context
                    .read<HomeBloc>()
                    .add(GetOrderDetailsEvent(orderDetailsParams: OrderDetailsParams(id:widget.orderDetailsParam.id,userId:LoginScreen.userId )));

              },
            ),
          );
        },
      ),
    );
  }


}

// class OrderDetailsParams {
//   final String id;
//   final bool orderType;
//
//   OrderDetailsParams(this.id, this.orderType);
// }

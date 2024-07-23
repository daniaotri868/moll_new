import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:remy/core/config/routing/router.dart';
import 'package:remy/core/config/theme/app_theme.dart';
import 'package:remy/core/utils/extensions/build_context.dart';
import 'package:remy/feature/app/auth/presentation/bloc/auth_bloc.dart';
import 'package:remy/feature/app/auth/presentation/ui/screen/login_screen.dart';
import 'package:remy/feature/app/home/presentation/bloc/auth_bloc.dart';
import 'package:remy/feature/app/root/presentation/ui/screen/root_screen.dart';

import '../../../../../../common/constants/route.dart';
import '../../../../../../core/utils/responsive_padding.dart';
import '../../../../presentation/widgets/animated_dialog.dart';
import '../../../../presentation/widgets/app_text.dart';
import '../../../../presentation/widgets/app_text_field.dart';
import '../../../data/model/order_details_model.dart';
import '../../../domain/use_case/confirm_uscase.dart';
import '../../../domain/use_case/rate_usecase.dart';

class ConfirmScreen extends StatefulWidget {
  static String name="ConfirmScreen";
  final OrderDetailsModel ?data;
   ConfirmScreen({super.key,this.data});

  @override
  State<ConfirmScreen> createState() => _ConfirmScreenState();
}

class _ConfirmScreenState extends State<ConfirmScreen> {
  @override
  TextEditingController controllerNote = TextEditingController();
  double rate=0;

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: AppText("تأكيد"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [

            Expanded(
                child: Container(
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: context.colorScheme.primary.withOpacity(0.9))
                  ),
                  child: ListView.separated(
                      itemBuilder: (context, index) =>  Container(
                        height: 120.h,
                        padding: REdgeInsetsDirectional.all(8),
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(color: Color(0x0F101828), offset: Offset(0, 1), blurRadius: 2),
                            // BoxShadow(color: Color(0x1A101828), offset: Offset(0, 1), blurRadius: 3),
                          ],
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(
                            color: Colors.white38,
                          ),
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              child: RSizedBox(
                                height: 90,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(18.r),
                                  ),
                                  child: FancyShimmerImage(
                                    // imageUrl: faker.image.image(random: true),
                                    imageUrl:   "${EndPoints.address}/${widget.data?.products?[index].name??""}",
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 3,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      10.verticalSpace,
                                      AppText(widget.data?.products?[index].name??"",overflow: TextOverflow.ellipsis,),
                                      10.verticalSpace,
                                      AppText("${widget.data?.products?[index].price}ل.س"),
                                      5.verticalSpace,
                                    ],
                                  ),
                                  Container(height: 20,color: Colors.black,width: 2,),
                                  // 20.horizontalSpace,
                                  AppText((widget.data?.products?[index].quantity).toString()),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      separatorBuilder: (context, index) => 5.verticalSpace,
                      itemCount: widget.data?.products?.length??0),
                )
            ),
            20.verticalSpace,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppText("    اسم المول  "),
                AppText(" ${widget.data?.mallName??""} "),
              ],
            ),
            5.verticalSpace,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppText("عدد المنتجات "),
                AppText("${widget.data?.number??""}"),
              ],
            ),
            5.verticalSpace,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppText("الملاحظات المذكورة "),
                AppText("${widget.data?.note??"لا يوجد"}"),
              ],
            ),
            5.verticalSpace,
            Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppText("السعر الإجمالي "),
                AppText("${widget.data?.finalCost??""}"),
              ],
            ),
            5.verticalSpace,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppText("سعر التوصيل "),
                AppText("${widget.data?.deliveryCost??"0"}"),
              ],
            ),
            5.verticalSpace,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppText("السعر الكلي "),
                AppText("${widget.data?.totalCost??""}"),
              ],
            ),
            5.verticalSpace,
            AppTextField(
              name: "note",
              controller: controllerNote,
              hintText: "اكتب ملاحظاتك",
              // validator: (text) => text != null && text.length >0
              //     ? null
              //     : "ادخل الاسم الاول",
              prefixIcon: Icon(
                Icons.person,
                color: context.colorScheme.primary,
              ),
            ),
            60.verticalSpace,
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(onPressed: () {
                    AnimatedDialog.show(
                      context,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),

                        ),
                        height: 230,
                        width: 125,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            AppText("هل تريد التقييم؟"),
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
                            50.verticalSpace,
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: ElevatedButton(onPressed: () {
                                      context.read<HomeBloc>().add(
                                          ConfirmOrderEvent(
                                            confirmOrderParams: ConfirmOrderParams(
                                              userId:LoginScreen.userId ,
                                              id: widget.data?.id??"",
                                              note: controllerNote.text,
                                            ),
                                            onSuccess: () {

                                              context.goNamed('/home');
                                            },
                                          )
                                      );
                                    }, child: AppText("نعم")),
                                  ),
                                  8.horizontalSpace,
                                  Expanded(
                                    child: ElevatedButton(onPressed: () {
                                      context.pop();
                                      context.read<HomeBloc>().add(
                                          RateOrderEvent(
                                            confirmOrderParams: RateOrderParams(
                                              userId:LoginScreen.userId ,
                                              id: widget.data?.id??"",
                                              note: controllerNote.text,
                                            ),
                                            onSuccess: () {

                                              context.goNamed('/home');
                                            },
                                          )
                                      ); context.read<HomeBloc>().add(
                                          ConfirmOrderEvent(
                                            confirmOrderParams: ConfirmOrderParams(
                                              userId:LoginScreen.userId ,
                                              id: widget.data?.id??"",
                                              note: controllerNote.text,

                                            ),
                                            onSuccess: () {

                                              context.goNamed('/home');
                                            },
                                          )
                                      );
                                    }, child: AppText("لا")),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      backgroundColor: context.colorScheme.onPrimary,
                      insetPadding: HWEdgeInsets.symmetric(horizontal: 30, vertical: 16),
                    );


                  }, child: AppText("تأكيد")),
                ),
                Expanded(
                  child: ElevatedButton(onPressed: () {

                  }, child: AppText("تعديل")),
                ),
              ],
            )

          ],
        ),
      ),
    );

  }
}

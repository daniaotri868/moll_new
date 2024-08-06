import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
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

class FinalEditeScreen extends StatefulWidget {
  static String name="FinalEditeScreen";
  final OrderDetailsModel ?data;
  FinalEditeScreen({super.key,this.data});

  @override
  State<FinalEditeScreen> createState() => _FinalEditeScreenState();
}

class _FinalEditeScreenState extends State<FinalEditeScreen> {
  @override
  TextEditingController controllerNote = TextEditingController();
  TextEditingController pointsController = TextEditingController(text: "0");
  double rate=0;

  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        toolbarHeight: 90,
        title: AppText("تأكيد السلة",              style: context.textTheme.headlineMedium?.copyWith(fontWeight: FontWeight.bold,color: context.colorScheme.primary),
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
        leading:  Padding(
          padding: const EdgeInsets.only(top: 15,bottom: 25,right: 8),
          child: InkWell(
            onTap: () {
              context.pop();
            },
            child: SizedBox(
              height: 30,
              child: Container(
                height: 20,
                decoration:  BoxDecoration(
                    boxShadow: [
                      BoxShadow(color: Color(0x0F101828), offset: Offset(0, 1), blurRadius: 2),
                      // BoxShadow(color: Color(0x1A101828), offset: Offset(0, 1), blurRadius: 3),
                    ],
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white
                ),
                child: Center(
                  child: Padding(
                    padding: EdgeInsets.only(right: 5),
                    child: Icon(Icons.arrow_back_ios,color: context.colorScheme.primary,),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: ListView(
          children: [
            SizedBox(
                height: 400,
                child: Container(
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: Colors.black.withOpacity(0.1)
                      )
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
                          color: Colors.white,
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
                                    imageUrl:   "${EndPoints.address}/${widget.data?.products?[index].imageUrl??""}",
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
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppText("   : اسم المول  "),
                12.horizontalSpace,
                AppText(" ${widget.data?.mallName??""} "),
              ],
            ),
            5.verticalSpace,
            Row(
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppText("   :الكود "),
                12.horizontalSpace,

                AppText("${widget.data?.number??""}"),
              ],
            ),
            5.verticalSpace,
            Row(
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppText("     :الملاحظات المذكورة "),
                12.horizontalSpace,

                AppText("${widget.data?.note??"لا يوجد"}"),
              ],
            ),
            5.verticalSpace,
            Divider(),
            Row(
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppText("      :السعر الإجمالي "),
                12.horizontalSpace,
                AppText("${widget.data?.finalCost??""}"),
              ],
            ),
            5.verticalSpace,
            Row(
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppText("  : سعر التوصيل "),
                12.horizontalSpace,
                AppText("${widget.data?.deliveryCost??"0"}"),
              ],
            ),
            5.verticalSpace,
            Row(
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppText("    :السعر الكلي "),
                12.horizontalSpace,
                AppText("${widget.data?.totalCost??""}"),
              ],
            ),
            5.verticalSpace,
            Divider(),
            5.verticalSpace,
            AppTextField(
              minLines: 2,
              maxLines: 2,
              name: "note",
              controller: controllerNote,
              title: "اكتب ملاحظاتك",
              // validator: (text) => text != null && text.length >0
              //     ? null
              //     : "ادخل الاسم الاول",
              // prefixIcon: Icon(
              //   Icons.person,
              //   color: context.colorScheme.primary,
              // ),
            ),
            5.verticalSpace,
            Row(
              children: [
                AppText("عدد النقاط :${widget.data?.pointsCanUse??0}")
              ],
            ),
            AppTextField(
              name: "note",
              controller: pointsController,
              title: "حدد عدد النقاط",
              textInputType:TextInputType.number,

              // validator:((pointsController.text)<=widget.data?.pointsCanUse??0)?true:false,
              // validator: (text) =>  int.tryParse(text??"")<widget.data?.pointsCanUse??0
              //     ? null
              //     : "ادخل الاسم الاول",
              // prefixIcon: Icon(
              //   Icons.person,
              //   color: context.colorScheme.primary,
              // ),
            ),
            10.verticalSpace,
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
                                      if((int.tryParse("${pointsController.text}")!)<=(widget.data?.pointsCanUse??0))  {context.read<HomeBloc>().add(
                                          ConfirmOrderEvent(
                                            confirmOrderParams: ConfirmOrderParams(
                                                userId:LoginScreen.userId ,
                                                id: widget.data?.id??"",
                                                note: controllerNote.text,
                                                pointsToUse: int.tryParse("${pointsController.text??"0"}")
                                            ),
                                            onSuccess: () {

                                              context.goNamed('/home');
                                            },
                                          )
                                      );}else Fluttertoast.showToast(
                                          msg: "عدد النقاط غير مسموح",
                                          toastLength: Toast.LENGTH_SHORT,
                                          gravity: ToastGravity.BOTTOM,
                                          timeInSecForIosWeb: 1,
                                          backgroundColor:  Colors.black,
                                          textColor: Colors.white,
                                          fontSize: 16.0);
                                    }, child: AppText("نعم")),
                                  ),
                                  8.horizontalSpace,
                                  Expanded(
                                    child: ElevatedButton(onPressed: () {
                                      print("-----------${int.tryParse("${pointsController.text}"
                                      )!<(widget.data?.pointsCanUse??0)}");
                                      if((int.tryParse("${pointsController.text}")!)<=(widget.data?.pointsCanUse??0)) {context.read<HomeBloc>().add(
                                          RateOrderEvent(
                                            confirmOrderParams: RateOrderParams(
                                              userId:LoginScreen.userId ,
                                              id: widget.data?.id??"",
                                              note: controllerNote.text,

                                            ),
                                            onSuccess: () {

                                              // context.goNamed('/home');
                                            },
                                          )
                                      ); context.read<HomeBloc>().add(
                                          ConfirmOrderEvent(
                                            confirmOrderParams: ConfirmOrderParams(
                                                userId:LoginScreen.userId ,
                                                id: widget.data?.id??"",
                                                note: controllerNote.text,
                                                pointsToUse: int.tryParse("${pointsController.text??"0"}")

                                            ),
                                            onSuccess: () {

                                              context.goNamed('/home');
                                            },
                                          )
                                      );}else{
                                        Fluttertoast.showToast(
                                            msg: "عدد النقاط غير مسموح",
                                            toastLength: Toast.LENGTH_SHORT,
                                            gravity: ToastGravity.BOTTOM,
                                            timeInSecForIosWeb: 1,
                                            backgroundColor:  Colors.black,
                                            textColor: Colors.white,
                                            fontSize: 16.0);
                                      }
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

                  }, child: AppText("تأكيد تعديل")),
                ),
                20.horizontalSpace,
              ],
            )

          ],
        ),
      ),
    );

  }
}

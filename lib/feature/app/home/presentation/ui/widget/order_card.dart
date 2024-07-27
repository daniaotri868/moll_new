// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:remy/core/utils/extensions/build_context.dart';
import 'package:remy/feature/app/auth/presentation/ui/screen/login_screen.dart';

import '../../../../../../common/helpers/helper_functions.dart';
import '../../../../presentation/widgets/app_text.dart';
import '../../../data/model/all_order_model.dart';
import '../../../domain/use_case/order_details.dart';
import '../screen/order_details_page.dart';

class OrderCard extends StatefulWidget {
  const OrderCard({
    Key? key,
    required this.item,
    required this.orderType
  }) : super(key: key);

  final AllOrderModel item;
  final String orderType;

  @override
  State<OrderCard> createState() => _OrderCardState();
}

class _OrderCardState extends State<OrderCard> {


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: REdgeInsets.all(10.0),
      child: Container(
        height: 156.h,
        width: double.infinity.w,
        decoration: BoxDecoration(
          color: Colors.white,
            boxShadow: [
              BoxShadow(color: Color(0x0F101828), offset: Offset(0, 1), blurRadius: 2),
              // BoxShadow(color: Color(0x1A101828), offset: Offset(0, 1), blurRadius: 3),
            ],
            border: Border.all(color: context.colorScheme.outline.withOpacity(0.1)),
        borderRadius: BorderRadius.circular(10)),
        child: Row(
          children: [
            // AppImage.asset(Assets.images.shopping.path),
            5.horizontalSpace,
            Flexible(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  5.verticalSpace,
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //   children: [
                  //     AppText(
                  //       widget.item.status??"",
                  //       overflow: TextOverflow.ellipsis,
                  //     ),
                  //     AppText(
                  //       widget.item.dateCreated.toString()??"",
                  //       overflow: TextOverflow.ellipsis,
                  //     ),
                  //   ],
                  // ),
                  // 2.verticalSpace,
                  Expanded(
                    child: Padding(
                      padding: REdgeInsets.only(left: 5.0),
                      child: Row(
                        children: [
                          AppText(
                            "رقم المنتج",
                            style:
                                context.textTheme.titleSmall!.copyWith(
                              color: Colors.black,
                            ),
                          ),
                          3.horizontalSpace,
                          AppText(
                            " ${widget.item.number}",
                            style: context.textTheme.titleSmall!.copyWith(
                                color: Colors.black),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Row(
                      children: [
                        AppText(
                          "الحالة ",
                          style: context.textTheme.titleSmall!.copyWith(
                            color: Colors.black,
                          ),
                        ),
                        3.horizontalSpace,
                        AppText(
                          " ${widget.item.status}",
                          style: context.textTheme.titleSmall!.copyWith(
                              color: Colors.black),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Row(
                      children: [
                        AppText(
                          "السعر الكلي ",
                          style: context.textTheme.titleSmall!.copyWith(
                            color: Colors.black,
                          ),
                        ),
                        3.horizontalSpace,
                        AppText(
                          '${HelperFunctions.formatPrice(widget.item.cost??0)} ل.س ',
                          style: context.textTheme.titleSmall!.copyWith(
                              color: Colors.black),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            // const Spacer(),
            
            Flexible(
              child: Column(
                children: [
                  10.verticalSpace,
                  Padding(
                    padding: REdgeInsets.only(left: 5.0),
                    child: AppText(
                      // HelperFunctions.formatDateTimeString(widget.itme.orderCreated)
                      "",
                      style: context.textTheme.titleSmall!.copyWith(
                          color: context.colorScheme.inversePrimary
                              .withOpacity(0.4)),
                    ),
                  ),
                  const Spacer(),
                  TextButton(
                    onPressed: () {
                      context.pushNamed(
                        OrderDetailsPage.name,
                        extra: OrderDetailsParams(userId: LoginScreen.userId,id: widget.item.id??"",),
                      );
                    },
                    child: Column(
                      children: [
                         Text('تفاصيل',style: TextStyle(color: context.colorScheme.primary),),
                        SizedBox(
                          width: 40,
                          child: Divider(
                            height: 1,
                            color: context.colorScheme.primary,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

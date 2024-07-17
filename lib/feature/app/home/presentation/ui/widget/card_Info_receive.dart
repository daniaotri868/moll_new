//
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:remy/core/utils/extensions/build_context.dart';
//
// import '../../../data/model/order_details_model.dart';
//
//
// class CardInfoRecive extends StatefulWidget {
//   const CardInfoRecive({super.key, required this.orderDetails});
//   final OrderDetailsModel orderDetails;
//
//   @override
//   State<CardInfoRecive> createState() => _CardInfoReciveState();
// }
//
// class _CardInfoReciveState extends State<CardInfoRecive> {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: REdgeInsetsDirectional.all(10),
//       height: 120.h,
//       width: 328.w,
//       decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(10.r),
//           color: context.colorScheme.onPrimary),
//       child: Column(
//         children: [
//           Row(
//             children: [
//               AppImage.asset(
//                 Assets.svg.person,
//                 color: context.colorScheme.outline,
//               ),
//               25.horizontalSpace,
//               Text(
//                 'معلومات المستلم',
//                 style: context.textTheme.titleMedium!.copyWith(
//                   color: context.colorScheme.tertiaryContainer,
//                   overflow: TextOverflow.ellipsis,
//                 ),
//               )
//             ],
//           ),
//           10.verticalSpace,
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Text(
//                 'الاسم',
//                 style: context.textTheme.titleSmall!.copyWith(
//                   color: context.colorScheme.shadow,
//                 ),
//               ),
//               Text(
//                 widget.orderDetails.recieverName,
//                 style: context.textTheme.titleSmall!
//                     .copyWith(color: context.colorScheme.shadow),
//               )
//             ],
//           ),
//           10.verticalSpace,
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Text(
//                 'الرقم',
//                 style: context.textTheme.titleSmall!.copyWith(
//                   color: context.colorScheme.shadow,
//                 ),
//               ),
//               Text(
//                 widget.orderDetails.phone,
//                 style: context.textTheme.titleSmall!
//                     .copyWith(color: context.colorScheme.shadow),
//               )
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }

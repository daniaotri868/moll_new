import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:remy/core/utils/extensions/build_context.dart';

import '../../../../presentation/widgets/app_text.dart';
import '../../../data/model/home_model.dart';
import '../../../data/model/order_details_model.dart';

class ItemOrder extends StatefulWidget {
  const ItemOrder({super.key, this.padding, required this.item});
  final bool? padding;
  final Product item;
  @override
  State<ItemOrder> createState() => _ItemOrderState();
}

class _ItemOrderState extends State<ItemOrder> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: widget.padding!
          ? REdgeInsetsDirectional.only(start: 0.w, end: 0.w, bottom: 10)
          : REdgeInsetsDirectional.only(start: 24.w, end: 24.w, bottom: 10),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.r),
          color: Colors.white,
        ),
        child: Row(
          children: [
            Expanded(
              flex: 2,
              child: SizedBox(
                height: 100.h,
                child: CachedNetworkImage(
                  imageUrl: "",
                  imageBuilder: (context, imageProvider) => Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                        image: imageProvider,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  placeholder: (context, url) => SizedBox(
                    height: 100.h,
                    child: Center(
                      child: CircularProgressIndicator(
                        color: context.colorScheme.primary,
                      ),
                    ),
                  ),
                  errorWidget: (context, url, error) => SizedBox(
                    height: 100.h,
                    child: const Icon(
                      Icons.image_not_supported_rounded,
                      color: Colors.grey,
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 5,
              child: Padding(
                padding: REdgeInsetsDirectional.only(start: 12.w, end: 12.w),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 130.w,
                          child: AppText(
                            "${widget.item.name}",
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                    30.verticalSpace,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        AppText(
                          'السعر: ${widget.item.price.toString()}',
                          style: context.textTheme.titleSmall!.copyWith(
                            color: context.colorScheme.inversePrimary,
                          ),
                        ),
                        // AppText(
                        //   " ${HelperFunctions.formatPrice(widget.item.price)}  ل.س ",
                        //   color: Colors.black,
                        // )
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

import 'package:cached_network_image/cached_network_image.dart';
import 'package:faker/faker.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:remy/core/utils/extensions/build_context.dart';

import '../../../../common/constants/route.dart';
import '../../home/data/model/department_product.dart';
import '../../home/data/model/home_model.dart';
import '../../home/data/model/moll_model.dart';
import '../../home/presentation/ui/screen/details_product.dart';

class MollItem extends StatelessWidget {
  final ProductItem ?item;
  const MollItem({super.key,this.item});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.pushNamed(DetailsProduct.name,extra: item?.id??"");

      },
      child: Container(
        padding: EdgeInsets.only(left: 12.r),
        width: 180.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(18.r),

          ),

        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 90,
              child: ClipRRect(
                borderRadius: BorderRadius.all(
                  Radius.circular(18.r),
                ),
                child: Container(
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(color: Colors.black.withOpacity(0.4), offset: Offset(-1, -2), blurRadius: 3),
                      // BoxShadow(color: Colors.black, offset: Offset(0, 1), blurRadius: 3),
                    ],
                  ),
                  child: FancyShimmerImage(
                    // imageUrl: faker.image.image(random: true),
                    imageUrl: "${EndPoints.address}/${item?.imageUrl??""}",
                  ),
                ),
              ),
            ),
            8.verticalSpace,
            // Text(
            //   item?.name??"",
            //   style: context.textTheme.bodySmall?.copyWith(fontWeight: FontWeight.w700),
            // ),
            Padding(
              padding:EdgeInsets.only(left: 3,right: 3),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    item?.name??"",
                    style: context.textTheme.bodySmall?.copyWith(fontWeight: FontWeight.w700),
                  ),
                  Container(
                    padding: EdgeInsets.all(4.r),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16.r),
                      color: context.colorScheme.primary.withOpacity(.2),
                    ),
                    child: Text(
                      "${item?.price} ل.س",
                      style: context.textTheme.labelSmall?.copyWith(
                        color: context.colorScheme.primary,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

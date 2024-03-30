import 'package:cached_network_image/cached_network_image.dart';
import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:remy/core/utils/extensions/build_context.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
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
          ClipRRect(
            borderRadius: BorderRadius.all(
              Radius.circular(18.r),
            ),
            child: CachedNetworkImage(
              imageUrl: faker.image.image(random: true),
            ),
          ),
          8.verticalSpace,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "مريولة جلي",
                style: context.textTheme.bodySmall?.copyWith(fontWeight: FontWeight.w700),
              ),
              Container(
                padding: EdgeInsets.all(8.r),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16.r),
                  color: context.colorScheme.primary.withOpacity(.2),
                ),
                child: Text(
                  "1000 ل.س",
                  style: context.textTheme.labelSmall?.copyWith(
                    color: context.colorScheme.primary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

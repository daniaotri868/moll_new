// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:remy/core/utils/extensions/build_context.dart';

class TitleWithSeeMore extends StatelessWidget {
  const TitleWithSeeMore({
    Key? key,
    required this.title,
    required this.onSeeMore,
  }) : super(key: key);

  final String title;
  final Function() onSeeMore;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: context.textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.bold),
        ),
        InkWell(
          onTap: onSeeMore,
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 8.r),
            child: Row(
              children: [
                Text(
                  "إظهار الكل",
                  style: context.textTheme.bodySmall?.copyWith(fontWeight: FontWeight.w500, color: context.colorScheme.primary),
                ),
                Icon(
                  Icons.keyboard_arrow_left_sharp,
                  color: context.colorScheme.primary,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

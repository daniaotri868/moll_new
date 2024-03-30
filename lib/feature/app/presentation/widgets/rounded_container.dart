// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:remy/core/utils/extensions/build_context.dart';

class RoundedContainer extends StatelessWidget {
  const RoundedContainer({
    Key? key,
    required this.icon,
    this.width,
    this.height,
  }) : super(key: key);

  final Widget icon;
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8.r),
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.14), // Adjust opacity as needed
            offset: Offset(2.0, 4.0),
            blurRadius: 7.3,
          ),
        ],
      ),
      child: icon,
    );
  }
}

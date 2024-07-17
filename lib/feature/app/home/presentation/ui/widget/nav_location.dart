import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:remy/core/config/theme/typography.dart';
import 'package:remy/core/utils/extensions/build_context.dart';

import '../../../../presentation/widgets/app_text.dart';

class NavLocationPage extends StatelessWidget {
  final String? title;
  final String? subTitle;
  final Function()? onPressed;
  const NavLocationPage({Key? key, this.title, this.subTitle, this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 101.h,
      color: Colors.white,
      child: Padding(
        padding: REdgeInsetsDirectional.only(top: 20,end: 30),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            InkWell(
              onTap: onPressed,
              child: CircleAvatar(
                radius: 20,
                backgroundColor: context.colorScheme.primary,
                child: Icon(
                  Icons.check,color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

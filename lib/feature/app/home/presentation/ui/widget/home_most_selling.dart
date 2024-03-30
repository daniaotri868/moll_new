import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:remy/feature/app/home/presentation/ui/widget/title_with_see_more.dart';
import 'package:remy/feature/app/presentation/widgets/product_item.dart';

class HomeMostSelling extends StatelessWidget {
  const HomeMostSelling({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.r),
          child: TitleWithSeeMore(title: "الأكثر مبيعاً", onSeeMore: () {}),
        ),
        8.verticalSpace,
        Padding(
          padding: EdgeInsets.only(right: 16.r),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                for (int i = 0; i < 10; i++) const ProductItem(),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

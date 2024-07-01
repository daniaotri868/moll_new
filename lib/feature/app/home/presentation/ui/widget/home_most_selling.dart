


import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:remy/feature/app/home/data/model/home_model.dart'as c;
import 'package:remy/feature/app/home/presentation/ui/widget/title_with_see_more.dart';

import '../../../../presentation/widgets/product_item.dart';

class HomeMostSelling extends StatelessWidget {
  final c.HomeModel ?data;
   HomeMostSelling({super.key,required this.data});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.r),
          child: TitleWithSeeMore(title: "الأكثر مبيعاً", onSeeMore: () {},data: data,),
        ),
        8.verticalSpace,
        SizedBox(
          height: 200,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount:data?.products!.length??0 ,
            itemBuilder: (context, index) => MollItem(item: data?.products![index],),
          ),
        )
      ],
    );
  }
}




import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:remy/core/config/routing/router.dart';
import 'package:remy/feature/app/home/data/model/home_model.dart'as c;
import 'package:remy/feature/app/home/presentation/ui/widget/title_with_see_more.dart';

import '../../../../presentation/widgets/product_item.dart';
import '../screen/product_home.dart';

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
          child: TitleWithSeeMore(title: "الأكثر مبيعاً", onSeeMore: () {
            context.pushNamed(ProductHomeScreen.name,extra: data?.products);
          },data: data,),
        ),
        8.verticalSpace,
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
            height: 120,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount:data?.products!.length??0 ,
              itemBuilder: (context, index) => MollItem(item: data?.products![index],),
            ),
          ),
        )
      ],
    );
  }
}

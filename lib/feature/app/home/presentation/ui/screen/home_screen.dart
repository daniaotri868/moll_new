import 'package:cached_network_image/cached_network_image.dart';
import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:remy/core/config/theme/my_color_scheme.dart';
import 'package:remy/core/utils/extensions/build_context.dart';
import 'package:remy/feature/app/home/data/model/home_ads_model.dart';
import 'package:remy/feature/app/home/presentation/ui/widget/home_ads.dart';
import 'package:remy/feature/app/home/presentation/ui/widget/home_app_bar.dart';
import 'package:remy/feature/app/home/presentation/ui/widget/home_most_selling.dart';
import 'package:remy/feature/app/home/presentation/ui/widget/title_with_see_more.dart';
import 'package:remy/feature/app/presentation/widgets/app_svg_picture.dart';
import 'package:remy/feature/app/presentation/widgets/app_text_field.dart';
import 'package:remy/feature/app/presentation/widgets/rounded_container.dart';
import 'package:remy/generated/assets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const HomeAppBar(),
          SizedBox(
            height: 20.h,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.r),
            child: AppTextField(
              name: "search",
              readOnly: true,
              hintText: "ابحث عن كل ما يجول في بالك",
              onTap: () {},
              filled: true,
              fillColor: context.colorScheme.white,
              borderRadius: BorderRadius.circular(10.r),
            ),
          ),
          SizedBox(
            height: 30.h,
          ),
          HomeAdsSlider(ads: HomeAdsModel.fakeData()),
          SizedBox(
            height: 16.h,
          ),
          const HomeMostSelling(),
        ],
      ),
    );
  }
}

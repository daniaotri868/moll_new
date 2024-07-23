import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:remy/feature/app/presentation/widgets/app_svg_picture.dart';
import 'package:remy/feature/app/presentation/widgets/rounded_container.dart';
import 'package:remy/generated/assets.dart';

import '../../../data/model/home_model.dart';

class HomeAppBar extends StatelessWidget {
  HomeModel ?data;
  VoidCallback ?onTap;
   HomeAppBar({super.key,required this.data,this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: 70.r,
        right: 16.r,
        left: 16.r,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            onTap: onTap,
            child: RoundedContainer(
              icon: const AppSvgPicture(
                Assets.homeMenue,
              ),
              height: 44.r,
              width: 44.r,
            ),
          ),
          RoundedContainer(
            icon: const Icon(
              Icons.shopping_cart,
            ),
            height: 44.r,
            width: 44.r,
          ),
        ],
      ),
    );
  }
}

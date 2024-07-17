import 'dart:ui';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:remy/core/utils/extensions/build_context.dart';
import 'package:remy/feature/app/home/data/model/home_ads_model.dart';
import 'package:remy/feature/app/presentation/widgets/custom_network_image.dart';

import '../../../../../../common/constants/route.dart';
import '../../../data/model/home_model.dart';

class HomeAdsSlider extends StatelessWidget {
  const HomeAdsSlider({super.key, required this.ads});

  final HomeModel ads;

  @override
  Widget build(BuildContext context) {
    return (ads.ads??[]).isEmpty
        ? const SizedBox()
        : CarouselSlider(
            options: CarouselOptions(
              autoPlay: true,
              reverse: false,
              initialPage: 0,
              height: 190.h,
              viewportFraction: 0.8,
              aspectRatio: 16 / 9,
              autoPlayInterval: const Duration(seconds: 3),
              autoPlayAnimationDuration: const Duration(milliseconds: 800),
              autoPlayCurve: Curves.easeInOut,
              enlargeCenterPage: true,
              scrollDirection: Axis.horizontal,
              enableInfiniteScroll: true,
            ),
            items: (ads.ads??[])
                .map((e) => GestureDetector(
                      onTap: () {
                        showDialog(
                            context: context,
                            builder: (context) {
                              return Dismissible(
                                  direction: DismissDirection.down,
                                  onDismissed: (_) {
                                    Navigator.of(context).pop();
                                  },
                                  key: UniqueKey(),
                                  child: Stack(
                                    children: [
                                      Positioned.fill(
                                        child: ImageFiltered(
                                          imageFilter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
                                          child:FancyShimmerImage(
                                            // imageUrl: faker.image.image(random: true),
                                            imageUrl:"${EndPoints.address}/${e.imageUrl}",
                                          ),
                                        ),
                                      ),
                                      Center(
                                          child:FancyShimmerImage(
                                            // imageUrl: faker.image.image(random: true),
                                            imageUrl:  "${EndPoints.address}/${e.imageUrl}",
                                          ),),
                                      Positioned(
                                        top: 24,
                                        right: 24,
                                        child: GestureDetector(
                                            onTap: () {
                                              Navigator.of(context).pop();
                                            },
                                            child: const Icon(
                                              CupertinoIcons.clear_circled,
                                              size: 42,
                                            )),
                                      ),
                                      Positioned(
                                        left: 16.r,
                                        right: 16.r,
                                        bottom: 24.r,
                                        child: Container(
                                          decoration: BoxDecoration(
                                            color: Colors.white.withOpacity(0.6),
                                            borderRadius: BorderRadius.circular(16),
                                          ),
                                          clipBehavior: Clip.hardEdge,
                                          padding: const EdgeInsets.all(16),
                                          child: BackdropFilter(
                                            filter: ImageFilter.blur(sigmaY: 8, sigmaX: 8),
                                            child: Text(
                                              e.name??"",
                                              textAlign: TextAlign.center,
                                              style: context.textTheme.titleMedium,
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  ));
                            });
                      },
                      child: Stack(
                        children: [
                          Container(
                            width: double.maxFinite,
                            clipBehavior: Clip.hardEdge,
                            decoration: BoxDecoration(borderRadius: BorderRadius.circular(16)),
                            child:
                            FancyShimmerImage(
                              // imageUrl: faker.image.image(random: true),
                              imageUrl:  "${EndPoints.address}/${e.imageUrl}",
                            ),
                          ),
                        ],
                      ),
                    ))
                .toList(),
          );
  }
}

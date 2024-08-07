import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:remy/core/config/theme/app_theme.dart';
import 'package:remy/core/config/theme/typography.dart';
import 'package:remy/core/utils/extensions/build_context.dart';
import 'package:remy/feature/app/presentation/pages/app.dart';
import 'package:remy/feature/app/presentation/widgets/app_text.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../../../core/config/routing/router.dart';

class BoardingScreen extends StatefulWidget {
  static String name="BoardingScreen";
  const BoardingScreen({super.key});

  @override
  State<BoardingScreen> createState() => _BoardingScreenState();
}

class _BoardingScreenState extends State<BoardingScreen> {
  @override
  final CarouselController _controller = CarouselController();
  int activeIndex = 0;

  Widget build(BuildContext context) {
    return Scaffold(
      body: CarouselSlider.builder(
        carouselController: _controller,
        itemCount: 3,
        itemBuilder: (context, index, realIndex) => Column(
          children: [
            80.verticalSpace,
            Stack(
              children: [
                Image.asset(index==0?'assets/image/en1.jpg':index==1?'assets/image/en2.jpg':'assets/image/en3.jpg',height: 250,width: double.infinity,),
                TextButton(onPressed: () {
                  context.goNamed(GRouter.config.authRoutes.login);

                }, child: AppText("تخطي"))
              ],
            ),
            Expanded(
              child: Container(
                // height: 400,
                decoration: BoxDecoration(
                color: context.colorScheme.primary.withOpacity(0.3),
                borderRadius: BorderRadius.only(topRight: Radius.circular(30),topLeft: Radius.circular(40))
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    margin: REdgeInsets.only(bottom: 17.h),
                    child: AnimatedSmoothIndicator(
                      activeIndex: activeIndex,
                      count: 3,
                      effect: ExpandingDotsEffect(
                        dotColor: Colors.white,
                        activeDotColor: context.colorScheme.primary,
                        dotHeight: 10.h,
                        dotWidth: 10.w,
                      ),
                    ),
                  ),
                  AppText(index==0?"الاستفادة من النقاط":index==1?"سرعة التوصيل":"المرونة في التسوق",style: context.textTheme.headlineMedium?.copyWith(fontWeight: FontWeight.bold,color: context.colorScheme.primary.withOpacity(0.8)),),
                  Padding(
                    padding: const EdgeInsets.all(15),
                    child: Center(child: AppText(index==0?"هنا يمكنك كسب نقاط من عمليات الشراء حيث يمكنك استخدام هذه النقاط في عملية طلبك السابقة":index==1?"تسوق براحة تامة و ستحصل على مشترياتك بسرعة وسنقوم بمتابعة حالة طلبك":"استمتع بتجربة تسوق فريدة حيث نقدم لك مجموعة واسعة من المتاجر و الممطاعم و الخدمات",style: context.textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.bold,color: context.colorScheme.primary.withOpacity(0.6),),textAlign: TextAlign.center,)),
                  ),

                ],
              ),
              ),
            )
          ],
        ),
        options: CarouselOptions(
          aspectRatio: 1 / 2,
          padEnds: false,
          viewportFraction: 1,
          enableInfiniteScroll: false,
          onPageChanged: (index, reason) => setState(
                () {
              // print(widget.images.length);
              activeIndex = index;
            },
          ),
        ),
      ),
    );
  }
}

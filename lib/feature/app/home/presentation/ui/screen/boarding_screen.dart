import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:remy/core/config/theme/app_theme.dart';
import 'package:remy/core/config/theme/typography.dart';
import 'package:remy/core/utils/extensions/build_context.dart';
import 'package:remy/feature/app/presentation/widgets/app_text.dart';

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
            Image.asset('assets/image/en${index}.jpg',height: 200,width: double.infinity,),
            AppText("hfghgfhgfhgfhfghfhfh"),
            Expanded(
              child: Container(
                height: 400,
                decoration: BoxDecoration(
                color: context.colorScheme.primary,
                borderRadius: BorderRadius.only(topRight: Radius.circular(20),topLeft: Radius.circular(20))
              ),),
            )
          ],
        ),
        options: CarouselOptions(
          aspectRatio: 3 / 2,
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

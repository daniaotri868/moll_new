import 'package:carousel_slider/carousel_slider.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:remy/core/utils/extensions/build_context.dart';
import 'package:remy/feature/app/home/presentation/bloc/auth_bloc.dart';
import 'package:remy/feature/app/presentation/widgets/app_text.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../../../common/models/page_state/result_builder.dart';
import '../../../../auth/presentation/ui/screen/login_screen.dart';
import '../../../../presentation/pages/empty_screen.dart';
import '../../../../presentation/pages/error_screen.dart';
import '../../../../presentation/pages/loading_screen.dart';
import '../../../../presentation/widgets/app_elvated_button.dart';
import '../../../domain/use_case/department_details_use_case.dart';

class DetailsProduct extends StatefulWidget {
  static String name="DetailsProduct";
  final String idProduct;
  const DetailsProduct({super.key,required this.idProduct});

  @override
  State<DetailsProduct> createState() => _DetailsProductState();
}

class _DetailsProductState extends State<DetailsProduct> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<HomeBloc>().add(ProductDetailsEvent(detailsParams: DetailsParams(id: widget.idProduct,userId: LoginScreen.userId)));
  }
  @override
  final CarouselController _controller = CarouselController();
  int activeIndex = 0;
  int q=1;

  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        return PageStateBuilder(
          success: (data) =>Scaffold(
            body:  Column(
              children: [
                CarouselSlider.builder(
                  carouselController: _controller,
                  itemCount: data.subImageUrls?.length ?? 1,
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
                  itemBuilder: (BuildContext context, int index, int realIndex) =>
                      Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  bottomRight: Radius.circular(16.r),
                                  bottomLeft: Radius.circular(16.r))),
                          child: ClipRRect(
                              borderRadius: BorderRadius.only(
                                  bottomRight: Radius.circular(16.r),
                                  bottomLeft: Radius.circular(16.r)),
                              child: AspectRatio(
                                aspectRatio: 1.h / 1.h,
                                child: FancyShimmerImage(
                                  errorWidget: const Center(
                                    child: Icon(
                                      Icons.image_not_supported,
                                      size: 30,
                                    ),
                                  ),
                                  imageUrl: data.subImageUrls?[index] ?? "",
                                  boxFit: BoxFit.cover,
                                  width: double.infinity,
                                ),
                              ))),
                ),
                Container(
                  margin: REdgeInsets.only(bottom: 17.h),
                  child: AnimatedSmoothIndicator(
                    activeIndex: activeIndex,
                    count: data.subImageUrls?.length ?? 0,
                    effect: ExpandingDotsEffect(
                      dotColor: Colors.grey,
                      activeDotColor: context.colorScheme.primary,
                      dotHeight: 10.h,
                      dotWidth: 10.w,
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    width: double.infinity,
                    padding: REdgeInsetsDirectional.all(10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(30),
                            topRight: Radius.circular(30)
                        ),
                        color:Color(0xffF3F2FE)
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        30.verticalSpace,
                        AppText(data.name??"", style: context.textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w700),),
                        30.verticalSpace,
                        AppText(data.mallName.toString()??"", style: context.textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w700),),
                        20.verticalSpace,
                        Row(
                          children: [
                            RatingBar.builder(
                              initialRating: double.tryParse("${data.evaluation}")??0.0,
                              minRating: 1,
                              direction: Axis.horizontal,
                              allowHalfRating: false,
                              itemCount: 5,
                              itemSize: 20.0,
                              itemBuilder: (context, _) => const Icon(
                                Icons.star,
                                color: Colors.amber,
                              ),
                              ignoreGestures: true,
                              onRatingUpdate: (rating) {
                                print(rating);
                              },
                            ),
                            AppText(data.evaluation.toString()??"", style: context.textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w700),),
                          ],
                        ),
                        30.verticalSpace,
                        Row(
                          children: [
                            Column(
                              children: [
                                if(data.offer?.priceAfterDiscount!=0)AppText(data.price.toString()??"", style: context.textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w700,  decoration: TextDecoration.lineThrough,),),
                                AppText((data.offer?.priceAfterDiscount!=0)?data.offer?.priceAfterDiscount.toString()??"":data.price.toString()??"", style: context.textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w700),),

                              ],
                            ),
                            20.horizontalSpace,
                            Container(height: 20,color: Colors.black,width: 2,),
                            20.horizontalSpace,
                            Row(
                              children: [
                                InkWell(
                                  onTap:(){
                                  setState(() {
                                    if(data.quantity!=q)q++;
                                  });
                                  },
                                  child: CircleAvatar(
                                    radius: 10,
                                    child: Icon(Icons.add,color: context.colorScheme.primary,size: 15,),
                                    backgroundColor: context.colorScheme.onPrimary,
                                  ),
                                ),
                                5.horizontalSpace,
                                AppText(q.toString()),
                                5.horizontalSpace,
                                InkWell(
                                  onTap: () {
                                  setState(() {
                                    if(q!=1)q--;
                                  });
                                  },
                                  child: CircleAvatar(
                                    radius: 10,
                                    child: Padding(
                                      padding: REdgeInsetsDirectional.only(bottom: 20),
                                      child: Icon(Icons.minimize_rounded,color: context.colorScheme.primary,size: 15,),
                                    ),
                                    backgroundColor: context.colorScheme.onPrimary,
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),

                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                   children: [
                    Expanded(
                      flex: 2,
                      child: InkWell(
                        onTap: () {
                          context.read<HomeBloc>().add(SaveProductsToPosEvent(
                            id: data.id,
                            qun: q,
                            price: data.price,
                            name: data.name,
                            offer: data.offer!.priceAfterDiscount,
                            max: data.quantity
                          ));
                        },
                        child: Container(
                          height: 50,
                          decoration: BoxDecoration(
                            color: context.colorScheme.primary,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Center(child:AppText("إضافة للسلة", style: context.textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w700,color: Colors.white),),
                          ),
                        ),
                      ),
                    ),
                    5.horizontalSpace,
                    Expanded(
                      child: InkWell(
                        onTap: () {

                        },
                        child: Container(
                          height: 50,
                          decoration: BoxDecoration(
                            color: context.colorScheme.primary,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Center(child:Icon(Icons.favorite,color: Colors.white,),
                          ),
                        ),
                      ),
                    ),

                   ],
                                 ),
                ),
              ],
            ),

          ),
          result: state.getProductDetails,
          loading: Scaffold(body: LoadingScreen(),),
          error: (error) => Scaffold(
            body: ErrorScreen(
              onRefresh: () {
                context.read<HomeBloc>().add(ProductDetailsEvent(detailsParams: DetailsParams(id: widget.idProduct,userId: LoginScreen.userId)));
              },
            ),
          ),
          empty: Scaffold(body: EmptyScreen(),),
          init: Scaffold(body: Container(),),
        );
      },
    );
  }
}

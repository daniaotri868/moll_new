import 'package:cached_network_image/cached_network_image.dart';
import 'package:faker/faker.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:remy/core/config/theme/my_color_scheme.dart';
import 'package:remy/core/utils/extensions/build_context.dart';
import 'package:remy/feature/app/home/data/model/home_ads_model.dart';
import 'package:remy/feature/app/home/presentation/ui/screen/profile_page.dart';
import 'package:remy/feature/app/home/presentation/ui/screen/show_order_screen.dart';
import 'package:remy/feature/app/home/presentation/ui/widget/home_ads.dart';
import 'package:remy/feature/app/home/presentation/ui/widget/home_app_bar.dart';
import 'package:remy/feature/app/home/presentation/ui/widget/home_most_selling.dart';
import 'package:remy/feature/app/home/presentation/ui/widget/title_with_see_more.dart';
import 'package:remy/feature/app/presentation/widgets/app_svg_picture.dart';
import 'package:remy/feature/app/presentation/widgets/app_text_field.dart';
import 'package:remy/feature/app/presentation/widgets/rounded_container.dart';
import 'package:remy/generated/assets.dart';

import '../../../../../../common/constants/route.dart';
import '../../../../../../common/models/page_state/result_builder.dart';
import '../../../../auth/presentation/ui/screen/login_screen.dart';
import '../../../../presentation/pages/empty_screen.dart';
import '../../../../presentation/pages/error_screen.dart';
import '../../../../presentation/pages/loading_screen.dart';
import '../../../../presentation/widgets/app_text.dart';
import '../../../domain/use_case/moll_use_case.dart';
import '../../bloc/auth_bloc.dart';
import 'details_product.dart';
final GlobalKey<ScaffoldState> drawerKey = GlobalKey();

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

@override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<HomeBloc>().add(GetHomeEvent(detailsParams: MollParams(UserId: LoginScreen.userId, name: '')));
  }
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        return Scaffold(
          key:drawerKey ,
          drawer: Drawer(
            child: Column(
              children: [
                60.verticalSpace,
                // AppText("تفاصيل",style:context.textTheme.labelLarge?.copyWith(fontWeight: FontWeight.w700,color: context.colorScheme.primary) ,),
                TextButton(onPressed: () {
                  context.pushNamed(ProfileScreen.name);

                }, child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(Icons.person),
                    Text("الملف الشخصي"),
                  ],
                )),
                20.verticalSpace,
                Divider(),
                20.verticalSpace,
                TextButton(onPressed: () {
                  context.pushNamed(OrderPage.name);

                }, child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(Icons.shopping_cart),
                    Text("طلباتي "),
                  ],
                )),
                Divider(),
              ],
            ),
          ),
          body: PageStateBuilder(
              init: const SizedBox.shrink(),
              success: (data) =>SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    20.verticalSpace,
                     HomeAppBar(data: data,onTap: () {
                       drawerKey.currentState!.openDrawer();
                     },),
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
                    HomeAdsSlider(ads: data),
                    SizedBox(
                      height: 16.h,
                    ),
                     HomeMostSelling(data: data,),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.r),
                      child: TitleWithSeeMore(title: "المولات الأقرب إليك", onSeeMore: () {},data: data,),
                    ),
                    SizedBox(
                      height: 200,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) => InkWell(
                          onTap:  () {
                            context.pushNamed(DetailsProduct.name,extra: data.products?[index].id??"");

                          },
                          child: Container(
                            padding: EdgeInsets.only(left: 12.r),
                            width: 250.w,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(
                                Radius.circular(18.r),
                              ),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: 150,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(18.r),
                                    ),
                                    child: FancyShimmerImage(
                                      // imageUrl: faker.image.image(random: true),
                                      imageUrl: "${EndPoints.address}/${data.products?[index].imageUrl}",
                                    ),
                                  ),
                                ),
                                8.verticalSpace,
                                // Text(
                                //   item?.name??"",
                                //   style: context.textTheme.bodySmall?.copyWith(fontWeight: FontWeight.w700),
                                // ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      data.malls?[index]?.name??"",
                                      style: context.textTheme.bodySmall?.copyWith(fontWeight: FontWeight.w700),
                                    ),
                                    RatingBar.builder(
                                      initialRating: double.tryParse("${data.malls?[index]!.evaluation}")??0.0,
                                      minRating: 1,
                                      direction: Axis.horizontal,
                                      allowHalfRating: false,
                                      itemCount: 5,
                                      itemSize: 10.0,
                                      itemBuilder: (context, _) => const Icon(
                                        Icons.star,
                                        color: Colors.amber,
                                      ),
                                      ignoreGestures: true,
                                      onRatingUpdate: (rating) {
                                        print(rating);
                                      },
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        itemCount: data.malls?.length??0,
                      ),
                    )
                  ],
                ),
              ),
              loading: const LoadingScreen(),
              error: (error) =>  ErrorScreen(
                onRefresh: () {
                  print(LoginScreen.userId);
                },
              ),
              result: state.getHome,
              empty: const EmptyScreen())
        );
      },
    );
  }
}

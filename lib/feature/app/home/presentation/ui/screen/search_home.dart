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
import 'package:remy/feature/app/home/presentation/ui/screen/product_home.dart';
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
import '../../../../../../services/notification_service/push_notification_handler.dart';
import '../../../../auth/presentation/ui/screen/login_screen.dart';
import '../../../../presentation/pages/empty_screen.dart';
import '../../../../presentation/pages/error_screen.dart';
import '../../../../presentation/pages/loading_screen.dart';
import '../../../../presentation/widgets/app_text.dart';
import '../../../../presentation/widgets/product_item.dart';
import '../../../domain/use_case/moll_use_case.dart';
import '../../../domain/use_case/search_usecase.dart';
import '../../bloc/auth_bloc.dart';
import 'about.dart';
import 'details_mall.dart';
import 'details_product.dart';
import 'moll_home.dart';
import 'my_point.dart';
final GlobalKey<ScaffoldState> drawerKey = GlobalKey();

class SearchHomeScreen extends StatefulWidget {

  const SearchHomeScreen({super.key});

  @override
  State<SearchHomeScreen> createState() => _SearchHomeScreenState();
}

class _SearchHomeScreenState extends State<SearchHomeScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        return Scaffold(
            body: SingleChildScrollView(
              child: Column(
                children: [
                  60.verticalSpace,
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.r),
                    child: AppTextField(
                      name: "search",
                      textInputAction: TextInputAction.done,
                      // readOnly: true,
                      hintText: "ابحث عن كل ما يجول في بالك",
                      onSubmitted:(p0) {
                        context.read<HomeBloc>().add(SearchHomeEvent(
                            searchParams: SearchParams(
                                userId: LoginScreen.userId,
                                search: p0
                            ), onSuccess: () {  }
                        ));
                      },
                      filled: true,
                      fillColor: context.colorScheme.white,
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                  ),
                  PageStateBuilder(
                      init: const SizedBox.shrink(),
                      success: (data) =>Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          10.verticalSpace,
                          SizedBox(
                            height: 16.h,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 16.r),
                                child:  Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "المنتجات",
                                      style: context.textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.bold),
                                    ),
                                    InkWell(
                                      onTap: () {
                                        context.pushNamed(ProductHomeScreen.name,extra: data?.products);
                                      
                                      },
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(vertical: 8.r),
                                        child: Row(
                                          children: [
                                            Text(
                                              "إظهار الكل",
                                              style: context.textTheme.bodySmall?.copyWith(fontWeight: FontWeight.w500, color: context.colorScheme.primary),
                                            ),
                                            Icon(
                                              Icons.keyboard_arrow_left_sharp,
                                              color: context.colorScheme.primary,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              8.verticalSpace,
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: SizedBox(
                                  height: 150,
                                  child: (data.products??[]).isEmpty?Container(
                                    child: Center(
                                      child: Text("لا يوجد منتجات"),
                                    ),
                                  ):ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    itemCount:data?.products!.length??0 ,
                                    itemBuilder: (context, index) => MollItem(item: data?.products![index],),
                                  ),
                                ),
                              )
                            ],
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 16.r),
                            child:  Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "المولات",
                                  style: context.textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.bold),
                                ),
                                InkWell(
                                  onTap: () {
                                    context.pushNamed(MollHomeScreen.name,extra: data.malls);
                                      
                                  },
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(vertical: 8.r),
                                    child: Row(
                                      children: [
                                        Text(
                                          "إظهار الكل",
                                          style: context.textTheme.bodySmall?.copyWith(fontWeight: FontWeight.w500, color: context.colorScheme.primary),
                                        ),
                                        Icon(
                                          Icons.keyboard_arrow_left_sharp,
                                          color: context.colorScheme.primary,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(12),
                            child: SizedBox(
                              height: 200,
                              child: (data.malls??[]).isEmpty?Container(
                                child: Center(child: Text("لا يوجد مولات")),
                              ):ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) => InkWell(
                                  onTap:  () {
                                    context.pushNamed(DetailsMall.name,extra: data.malls?[index].id??"");
                                      
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
                                            child: Container(
                                              decoration: BoxDecoration(
                                                boxShadow: [
                                                  BoxShadow(color: Colors.black.withOpacity(0.4), offset: Offset(-1, -2), blurRadius: 3),
                                                  // BoxShadow(color: Colors.black, offset: Offset(0, 1), blurRadius: 3),
                                                ],
                                              ),
                                              child: FancyShimmerImage(
                                                // imageUrl: faker.image.image(random: true),
                                                imageUrl: "https://www.almrsal.com/wp-content/uploads/2015/01/khurais-mall-indoor.jpg",
                                              ),
                                            ),
                                          ),
                                        ),
                                        8.verticalSpace,
                                        // Text(
                                        //   item?.name??"",
                                        //   style: context.textTheme.bodySmall?.copyWith(fontWeight: FontWeight.w700),
                                        // ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Row(
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
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                itemCount: data.malls?.length??0,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 16.r),
                            child:  Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  "الأقسام",
                                  style: context.textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(12),
                            child: SizedBox(
                              height: 200,
                              child: (data.departments??[]).isEmpty?Container(
                                child: Center(child: Text(" لا يوجد أقسام")),
                              ):ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) => InkWell(
                                  onTap:  () {
                                    // context.pushNamed(DetailsMall.name,extra: data.malls?[index].id??"");

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
                                            child: Container(
                                              decoration: BoxDecoration(
                                                boxShadow: [
                                                  BoxShadow(color: Colors.black.withOpacity(0.4), offset: Offset(-1, -2), blurRadius: 3),
                                                  // BoxShadow(color: Colors.black, offset: Offset(0, 1), blurRadius: 3),
                                                ],
                                              ),
                                              child: FancyShimmerImage(
                                                // imageUrl: faker.image.image(random: true),
                                                imageUrl: "${EndPoints.address}/${data.departments?[index].imageUrl}",
                                              ),
                                            ),
                                          ),
                                        ),
                                        8.verticalSpace,
                                        // Text(
                                        //   item?.name??"",
                                        //   style: context.textTheme.bodySmall?.copyWith(fontWeight: FontWeight.w700),
                                        // ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                data.departments?[index]?.name??"",
                                                style: context.textTheme.bodySmall?.copyWith(fontWeight: FontWeight.w700),
                                              ),
                                              Text(
                                                data.departments?[index]?.mallName??"",
                                                style: context.textTheme.bodySmall?.copyWith(fontWeight: FontWeight.w700),
                                              ),

                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                itemCount: data.departments?.length??0,
                              ),
                            ),
                          ),
                        ],
                      ),
                      loading: const LoadingScreen(),
                      error: (error) =>  ErrorScreen(
                        onRefresh: () {
                          print(LoginScreen.userId);
                        },
                      ),
                      result: state.getSearchHome,
                      empty: const EmptyScreen()),
                ],
              ),
            )
        );
      },
    );
  }
}

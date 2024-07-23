import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:remy/common/models/page_state/result_builder.dart';
import 'package:remy/core/utils/extensions/build_context.dart';
import 'package:remy/feature/app/presentation/pages/empty_screen.dart';
import 'package:remy/feature/app/presentation/pages/loading_screen.dart';

import '../../../../../../common/constants/route.dart';
import '../../../../auth/presentation/ui/screen/login_screen.dart';
import '../../../../presentation/pages/error_screen.dart';
import '../../../../presentation/widgets/app_text.dart';
import '../../../../presentation/widgets/app_text_field.dart';
import '../../../../presentation/widgets/product_item.dart';
import '../../../domain/use_case/department_details_use_case.dart';
import '../../../domain/use_case/moll_use_case.dart';
import '../../bloc/auth_bloc.dart';
import 'all_dep.dart';
import 'details_mall.dart';

class MollScreen extends StatefulWidget {

  const MollScreen({Key? key}) : super(key: key);

  @override
  State<MollScreen> createState() => _MollScreenState();
}

class _MollScreenState extends State<MollScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<HomeBloc>().add(AllMollEvent(detailsParams: MollParams(name: "",UserId: LoginScreen.userId)));
  }
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        return Scaffold(
          appBar:  AppBar(
            title: AppText("مولات"),
            centerTitle: true,
          ),
          body:Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: AppTextField(
                  name: 'search',
                  textInputAction: TextInputAction.done,
                  // controller:searchController ,
                  hintText: "ابحث هنا",
                  onSubmitted: (val) {
                    context.read<HomeBloc>().add(AllMollEvent(detailsParams: MollParams(name: val??"",UserId: LoginScreen.userId)));
                  },
                ),
              ),
              Expanded(
                child: PageStateBuilder(
                  success: (data) =>  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GridView.builder(
                      gridDelegate:
                      const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 6,
                          childAspectRatio: 3 / 4),
                      itemBuilder: (context, index) => Container(
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
                              child: Stack(
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(18.r),
                                    ),
                                    child: InkWell(
                                      onTap: () {
                                        context.pushNamed(AllDepartmentScreen.name,extra: data.malls?[index].id??"");
                                      },
                                      child: FancyShimmerImage(
                                        // imageUrl: faker.image.image(random: true),
                                        imageUrl:  "${EndPoints.address}/${data.malls?[index].imageUrl}",
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    right: 5,
                                    height: 30,
                                    child: IconButton(onPressed: () {
                                      print("ppppppppp");
                                      context.pushNamed(DetailsMall.name,extra:data.malls?[index].id??"");
                                    }, icon: Icon(Icons.question_mark,color: Colors.black,)),
                                  ),

                                ],
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
                      itemCount: data.malls?.length??0,
                    ),
                  ),
                  result: state.getAllMoll,
                  loading: LoadingScreen(),
                  error: (error) => ErrorScreen(
                    onRefresh: () {
                      context.read<HomeBloc>().add(AllMollEvent(detailsParams: MollParams(name: "",UserId: 'adac2042-2519-4ee9-bb52-0e01300d0aa0')));
                
                    },
                  ),
                  empty: EmptyScreen(),
                  init: Container(),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

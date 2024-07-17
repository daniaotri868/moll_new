import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:remy/common/models/page_state/result_builder.dart';
import 'package:remy/core/utils/extensions/build_context.dart';
import 'package:remy/feature/app/home/presentation/ui/screen/product_dep.dart';
import 'package:remy/feature/app/presentation/pages/empty_screen.dart';
import 'package:remy/feature/app/presentation/pages/loading_screen.dart';
import 'package:remy/feature/app/presentation/widgets/app_text_field.dart';

import '../../../../../../common/constants/route.dart';
import '../../../../auth/presentation/ui/screen/login_screen.dart';
import '../../../../presentation/pages/error_screen.dart';
import '../../../../presentation/widgets/app_text.dart';
import '../../../../presentation/widgets/product_item.dart';
import '../../../domain/use_case/department_details_use_case.dart';
import '../../../domain/use_case/moll_use_case.dart';
import '../../bloc/auth_bloc.dart';

class AllDepartmentScreen extends StatefulWidget {
  static String name ="AllDepartmentScreen";
  final String ?idMoll;

  const AllDepartmentScreen({Key? key,this.idMoll}) : super(key: key);

  @override
  State<AllDepartmentScreen> createState() => _AllDepartmentScreenState();
}

class _AllDepartmentScreenState extends State<AllDepartmentScreen> {
  @override
  TextEditingController searchController =TextEditingController();

  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<HomeBloc>().add(AllDepartmentEvent(detailsParams:DetailsParams (id: widget.idMoll??"",userId: LoginScreen.userId)));
    // context.read<HomeBloc>().add(DepartmentDetailsEvent(detailsParams:DetailsParams (id: widget.idMoll??"",userId: 'adac2042-2519-4ee9-bb52-0e01300d0aa0')));
  }
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        return Scaffold(
          appBar:  AppBar(
            title: AppText("الأقسام"),
            centerTitle: true,
          ),
          body:Column(
            children: [
              AppTextField(
                name: 'search',
                textInputAction: TextInputAction.done,
                controller:searchController ,
                hintText: "ابحث عنها",
                onSubmitted: (val) {
                  context.read<HomeBloc>().add(AllDepartmentEvent(detailsParams:DetailsParams (id: widget.idMoll??"",userId: LoginScreen.userId,search: val)));

                },
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
                      itemBuilder: (context, index) =>InkWell(
                        onTap: () {
                          print("------------");
                            context.pushNamed(AllProductDepartmentScreen.name,extra: data.departments?[index].id??"");
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
                                    imageUrl:  "${EndPoints.address}/${data.departments?[index].imageUrl}",
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
                                    data.departments?[index].name??"",
                                    style: context.textTheme.bodySmall?.copyWith(fontWeight: FontWeight.w700),
                                  ),
                                  Text(
                                    data.departments?[index].phoneNumber??"",
                                    style: context.textTheme.bodySmall?.copyWith(fontWeight: FontWeight.w700),
                                  ),
                                  
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      itemCount: data.departments?.length??0,
                    ),
                  ),
                  result: state.getAllDepartment,
                  loading: LoadingScreen(),
                  error: (error) => ErrorScreen(
                    onRefresh: () {
                      context.read<HomeBloc>().add(AllDepartmentEvent(detailsParams:DetailsParams (id: widget.idMoll??"",userId: LoginScreen.userId)));
                
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

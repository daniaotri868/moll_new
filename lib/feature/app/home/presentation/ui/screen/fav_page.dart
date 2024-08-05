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
import '../../../../presentation/widgets/product_item.dart';
import '../../../domain/use_case/department_details_use_case.dart';
import '../../../domain/use_case/moll_use_case.dart';
import '../../bloc/auth_bloc.dart';
import 'details_product.dart';

class FavPage extends StatefulWidget {
  static String name ="AllProductDepartmentScreen";
  final String ?idDep;

  const FavPage({Key? key,this.idDep}) : super(key: key);

  @override
  State<FavPage> createState() => _FavPageState();
}

class _FavPageState extends State<FavPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<HomeBloc>().add(GetAllFavEvent(detailsParams:DetailsParams (userId: LoginScreen.userId)));
    // context.read<HomeBloc>().add(DepartmentDetailsEvent(detailsParams:DetailsParams (id: widget.idMoll??"",userId: 'adac2042-2519-4ee9-bb52-0e01300d0aa0')));
  }
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        return Scaffold(
          appBar:   AppBar(
            toolbarHeight: 90,
            title: AppText("المفضلة", style: context.textTheme.headlineMedium?.copyWith(fontWeight: FontWeight.bold,color: context.colorScheme.primary),
            ),
            centerTitle: true,
            automaticallyImplyLeading: false,
            leading:  Padding(
              padding: const EdgeInsets.only(top: 15,bottom: 25,right: 8),
              child: InkWell(
                onTap: () {
                  context.pop();
                },
                child: SizedBox(
                  height: 30,
                  child: Container(
                    height: 20,
                    decoration:  BoxDecoration(
                        boxShadow: [
                          BoxShadow(color: Color(0x0F101828), offset: Offset(0, 1), blurRadius: 2),
                          // BoxShadow(color: Color(0x1A101828), offset: Offset(0, 1), blurRadius: 3),
                        ],
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white
                    ),
                    child: Center(
                      child: Padding(
                        padding: EdgeInsets.only(right: 5),
                        child: Icon(Icons.arrow_back_ios,color: context.colorScheme.primary,),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            bottom: PreferredSize(
              preferredSize: Size(10, 5),
              child: Padding(
                padding: const EdgeInsets.only(left: 10,right: 10),
                child: Divider(),
              ),
            ),
          ),
          body:PageStateBuilder(
            success: (data) => (data.products??[]).isEmpty?EmptyScreen(): Padding(
              padding: const EdgeInsets.all(8.0),
              child: GridView.builder(
                gridDelegate:
                const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 6,
                    childAspectRatio: 3 / 4),
                itemBuilder: (context, index) =>Container(
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
                      InkWell(
                        onTap: () {
                          context.pushNamed(DetailsProduct.name,extra: data.products?[index].id??"");
                        },
                        child: SizedBox(
                          height: 150,
                          child: ClipRRect(
                            borderRadius: BorderRadius.all(
                              Radius.circular(18.r),
                            ),
                            child: FancyShimmerImage(
                              // imageUrl: faker.image.image(random: true),
                              imageUrl:  "${EndPoints.address}/${data.products?[index].imageUrl}",
                            ),
                          ),
                        ),
                      ),
                      8.verticalSpace,
                      // Text(
                      //   item?.name??"",
                      //   style: context.textTheme.bodySmall?.copyWith(fontWeight: FontWeight.w700),
                      // ),
                      Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                data.products?[index].name??"",
                                style: context.textTheme.bodySmall?.copyWith(fontWeight: FontWeight.w700),
                              ),
                              Container(
                                padding: REdgeInsetsDirectional.only(start: 10,end: 10,top: 5,bottom: 5),
                                decoration: BoxDecoration(
                                  // color: Color(0xff3F2FE),
                                  // borderRadius: BorderRadius.circular(20),
                                  borderRadius: BorderRadius.circular(16.r),
                                  color: context.colorScheme.primary.withOpacity(.2),
                                ),
                                child: Text(
                                  data.products?[index].price.toString()??"",
                                  style: context.textTheme.bodySmall?.copyWith(fontWeight: FontWeight.w700,color: context.colorScheme.primary),
                                ),
                              ),

                            ],
                          ),
                          5.verticalSpace,
                          InkWell(
                            onTap: () {
                              print(state.listCart);
                              print("55555555555${data.products?[index].quantity}");
                              context.read<HomeBloc>().add(SaveProductsToPosEvent(
                                id: data.products?[index].id,
                                qun: 1,
                                price: data.products?[index].price,
                                name: data.products?[index].name,
                                offer: data.products?[index].priceAfterDiscount,
                                max: data.products?[index].quantity,
                                image: data.products?[index].imageUrl,
                                mallId: data.products?[index].mallId,
                              ));
                            },
                            child: Container(
                              height: 25,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: context.colorScheme.primary
                              ),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  AppText("إضافة للسلة", style: context.textTheme.bodySmall?.copyWith(fontWeight: FontWeight.w100,color: Colors.white),),
                                  5.horizontalSpace,
                                  Icon(Icons.shopping_cart_rounded,color: Colors.white,size: 15,)
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                itemCount: data.products?.length??0,
              ),
            ),
            result: state.getAllFav,
            loading: LoadingScreen(),
            error: (error) => ErrorScreen(
              onRefresh: () {
                context.read<HomeBloc>().add(DepartmentProductEvent(detailsParams:DetailsParams (id: widget.idDep??"",userId: LoginScreen.userId)));
              },
            ),
            empty: EmptyScreen(),
            init: Container(),
          ),
        );
      },
    );
  }
}

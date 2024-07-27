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
import '../../../data/model/home_model.dart';
import '../../../domain/use_case/department_details_use_case.dart';
import '../../../domain/use_case/moll_use_case.dart';
import '../../bloc/auth_bloc.dart';
import 'details_product.dart';

class ProductHomeScreen extends StatefulWidget {
  static String name ="ProductHomeScreen";
  List<ProductItem> ?products;

   ProductHomeScreen({Key? key,this.products}) : super(key: key);

  @override
  State<ProductHomeScreen> createState() => _ProductHomeScreenState();
}

class _ProductHomeScreenState extends State<ProductHomeScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // context.read<HomeBloc>().add(DepartmentDetailsEvent(detailsParams:DetailsParams (id: widget.idMoll??"",userId: 'adac2042-2519-4ee9-bb52-0e01300d0aa0')));
  }
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        return Scaffold(
          appBar:  AppBar(
            toolbarHeight: 90,
            title: AppText("المنتجات الأكثر مبيعاً ",style: context.textTheme.bodySmall?.copyWith(fontWeight: FontWeight.w700),
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
          ),
          body:GridView.builder(
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
                      context.pushNamed(DetailsProduct.name,extra: widget.products?[index].id??"");
                    },
                    child: SizedBox(
                      height: 150,
                      child: ClipRRect(
                        borderRadius: BorderRadius.all(
                          Radius.circular(18.r),
                        ),
                        child: FancyShimmerImage(
                          // imageUrl: faker.image.image(random: true),
                          imageUrl:  "${EndPoints.address}/${widget.products?[index].imageUrl}",
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
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              widget.products?[index].name??"",
                              style: context.textTheme.bodySmall?.copyWith(fontWeight: FontWeight.w700),
                            ),
                            Container(
                              padding: EdgeInsets.all(4.r),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16.r),
                                color: context.colorScheme.primary.withOpacity(.2),
                              ),
                              child: Text(
                                "${widget.products?[index].price.toString()??" "}ل.س",
                                style: context.textTheme.labelSmall?.copyWith(
                                  color: context.colorScheme.primary,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),

                          ],
                        ),
                        5.verticalSpace,
                        InkWell(
                          onTap: () {
                            print(state.listCart);
                            // print("55555555555${widget.products?[index].quantity}");
                            context.read<HomeBloc>().add(SaveProductsToPosEvent(
                              id: widget.products?[index].id,
                              qun: 1,
                              price: widget.products?[index].price,
                              name: widget.products?[index].name,
                              // offer: widget.products?[index].priceAfterDiscount,
                              // max: widget.products?[index].quantity,
                              image: widget.products?[index].imageUrl,
                              // mallId: widget.products?[index].mallId,
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
                  ),
                ],
              ),
            ),
            itemCount: widget.products?.length??0,
          ),
        );
      },
    );
  }
}

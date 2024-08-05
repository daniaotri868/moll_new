import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:remy/core/utils/extensions/build_context.dart';
import 'package:remy/feature/app/home/data/model/home_model.dart';

import '../../../../../../common/constants/route.dart';
import '../../../../presentation/widgets/app_text.dart';
import '../../bloc/auth_bloc.dart';

class ItemCart extends StatefulWidget {
  final ProductCart data;
  final int index;
  const ItemCart({super.key,required this.data,required this.index});

  @override
  State<ItemCart> createState() => _ItemCartState();
}

class _ItemCartState extends State<ItemCart> {
  int q=1;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
     q=widget.data.qun??1;
  }
  @override
  Widget build(BuildContext context) {
    return  Container(
      height: 120.h,
      padding: REdgeInsetsDirectional.all(8),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(color: Color(0x0F101828), offset: Offset(0, 1), blurRadius: 2),
          // BoxShadow(color: Color(0x1A101828), offset: Offset(0, 1), blurRadius: 3),
        ],
        borderRadius: BorderRadius.circular(15),
        color: Colors.white,
        border: Border.all(
          color: Colors.white38,
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: RSizedBox(
              height: 90,
              child: ClipRRect(
                borderRadius: BorderRadius.all(
                  Radius.circular(18.r),
                ),
                child: FancyShimmerImage(
                  // imageUrl: faker.image.image(random: true),
                  imageUrl:  "${EndPoints.address}/${widget.data?.image??""}",
                ),
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    10.verticalSpace,
                    AppText(widget.data.name??"",overflow: TextOverflow.ellipsis, style: context.textTheme.bodySmall?.copyWith(fontWeight: FontWeight.w700),
                    ),
                    10.verticalSpace,
                    Row(
                      children: [
                        AppText("  ${widget.data.price!*q}",                                          style: context.textTheme.bodySmall?.copyWith(fontWeight: FontWeight.w700),
                        ),
                        AppText("ل.س",                                          style: context.textTheme.bodySmall?.copyWith(fontWeight: FontWeight.w700),
                        ),
                      ],
                    ),
                    5.verticalSpace,
                  ],
                ),
                Container(height: 20,color: Colors.black,width: 2,),
                // 20.horizontalSpace,
                Row(
                  children: [
                    InkWell(
                      onTap:(){
                        setState(() {
                          print(widget.data.max);
                          if(q!=widget.data.max){
                            q++;
                            context.read<HomeBloc>().add(updateProductToOrderInPosEvent(
                                count: 1,
                                index: widget.index
                            ));
                          }

                        });
                      },
                      child: CircleAvatar(
                        radius: 10,
                        child: Icon(Icons.add,color: context.colorScheme.onPrimary,size: 15,),
                        backgroundColor: context.colorScheme.primary,
                      ),
                    ),
                    5.horizontalSpace,
                    AppText(q.toString(),style: context.textTheme.bodySmall?.copyWith(fontWeight: FontWeight.w700),
                    ),
                    5.horizontalSpace,
                    InkWell(
                      onTap: () {
                        setState(() {
                          if(q!=1){
                            q--;
                            context.read<HomeBloc>().add(updateProductToOrderInPosEvent(
                                count: -1,
                                index: widget.index
                            ));
                          }

                        });
                      },
                      child:Icon(Icons.remove_circle_outline,color: context.colorScheme.primary,size: 23,),
                    ),
                  ],
                )
              ],
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconButton(onPressed: () {
                context.read<HomeBloc>().add(DeleteProductsToPosEvent(
                  productItem:ProductCart(
                    qun: widget.data.qun,
                    name: widget.data.name,
                    offer: widget.data.offer,
                    price: widget.data.price,
                    id: widget.data.id,
                  ) ,
                ));
              }, icon: Icon(Icons.close)),
            ],
          )
        ],
      ),
    );
  }
}

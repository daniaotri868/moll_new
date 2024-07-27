import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:remy/core/utils/extensions/build_context.dart';
import 'package:remy/feature/app/presentation/widgets/app_elvated_button.dart';
import 'package:remy/feature/app/presentation/widgets/app_text.dart';

import '../../../data/model/home_model.dart';
import '../../bloc/auth_bloc.dart';
import '../widget/item_cart.dart';
import 'confirm_edite.dart';
import 'order_screen.dart';

class EditeCartPage extends StatefulWidget {
  String id;
  static String name="EditeCartPage";
  EditeCartPage({super.key,required this.id});

  @override
  State<EditeCartPage> createState() => _EditeCartPageState();
}

class _EditeCartPageState extends State<EditeCartPage> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        return Scaffold(
          appBar:  AppBar(
            toolbarHeight: 90,
            title: AppText("تعديل سلّة التّسوق ",
              style: context.textTheme.headlineMedium?.copyWith(fontWeight: FontWeight.bold,color: context.colorScheme.primary),
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
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Expanded(
                  child: ListView.separated(
                    itemBuilder: (context, index) =>
                        ItemCart(data:state.listCart![index], index: index,),
                    separatorBuilder:(context, index) =>  10.verticalSpace,
                    itemCount: state.listCart?.length??0,
                  ),
                ),
                AppElevatedButton(
                    style:  ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                    ),
                    onPressed: () {
                      (state.listCart??[]).isEmpty?
                      Fluttertoast.showToast(
                          msg: "اضف منتج للسلة",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.BOTTOM,
                          timeInSecForIosWeb: 1,
                          backgroundColor:  Colors.black,
                          textColor: Colors.white,
                          fontSize: 16.0)
                          :context.pushNamed(EditeOrderScreen.name,extra: widget.id);
                    }, child: AppText("متابعة",style: context.textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.bold,color: Colors.white),
                )),
                50.verticalSpace,
              ],
            ),
          ),
        );
      },
    );
  }
}

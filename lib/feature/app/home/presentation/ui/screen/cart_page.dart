import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:remy/core/utils/extensions/build_context.dart';
import 'package:remy/feature/app/presentation/widgets/app_text.dart';

import '../../../data/model/home_model.dart';
import '../../bloc/auth_bloc.dart';
import '../widget/item_cart.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        return Scaffold(
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView.separated(
              itemBuilder: (context, index) =>
              ItemCart(data:state.listCart![index], index: index,),
              separatorBuilder:(context, index) =>  10.verticalSpace,
              itemCount: state.listCart?.length??0,
            ),
          ),
        );
      },
    );
  }
}

// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:remy/feature/app/home/domain/use_case/get_order_usecase.dart';
import 'package:remy/feature/app/home/presentation/bloc/auth_bloc.dart';
import 'package:remy/feature/app/presentation/pages/empty_screen.dart';
import 'package:remy/feature/app/presentation/pages/loading_screen.dart';

import '../../../../../../common/models/page_state/result_builder.dart';
import '../../../../auth/presentation/ui/screen/login_screen.dart';
import 'order_card.dart';



class OrderTap extends StatefulWidget {
  const OrderTap({
    Key? key,
    required this.orderType,
  }) : super(key: key);
  final String orderType;

  @override
  State<OrderTap> createState() => _OrderTapState();
}

class _OrderTapState extends State<OrderTap> {
  @override
  void initState() {
    context.read<HomeBloc>().add(
        GetOrderEvent(getOrderParams: GetOrderParams(
            userId: LoginScreen.userId,
            type: widget.orderType
        ))
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        return PageStateBuilder(
          result:state.getOrders,
          // widget.orderType ? state.orders : state.ordersPrevious,
          success: (data) => ListView.builder(
            itemBuilder: (context, index) {
              // print(data[index].orderStatus);
              // print(data[index].id);
              // print(data[index].identifier);

              return OrderCard(
                orderType: widget.orderType,
                item: data[index],
              );
            },
            itemCount: data.length,
          ),
          empty: EmptyScreen(),
          error: (eror) => const Center(
            child: Icon(Icons.error),
          ),
          init: Container(),
          loading: const LoadingScreen(),
        );
      },
    );
  }
}

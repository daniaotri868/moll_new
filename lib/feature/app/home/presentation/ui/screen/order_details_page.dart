
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:remy/core/utils/extensions/build_context.dart';
import 'package:remy/feature/app/presentation/pages/empty_screen.dart';
import '../../../../../../common/helpers/helper_functions.dart';
import '../../../../auth/presentation/ui/screen/login_screen.dart';
import '../../../../presentation/pages/error_screen.dart';
import '../../../../presentation/widgets/app_scaffold.dart';
import '../../../domain/use_case/order_details.dart';
import '../../bloc/auth_bloc.dart';

import '../widget/item_order.dart';


class OrderDetailsPage extends StatefulWidget {
  const OrderDetailsPage({super.key, required this.orderDetailsParam});

  static const path = "orderDetails";
  static const name = "orderDetails";
  final OrderDetailsParams orderDetailsParam;

  @override
  State<OrderDetailsPage> createState() => _OrderDetailsPageState();
}

class _OrderDetailsPageState extends State<OrderDetailsPage> {
  @override
  void initState() {
    context
        .read<HomeBloc>()
        .add(GetOrderDetailsEvent(orderDetailsParams: OrderDetailsParams(id:widget.orderDetailsParam.id,userId:LoginScreen.userId )));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      backgroundColor: context.colorScheme.onPrimary,
      // appBar: AppBarWidget(context: context, title: "تفاصيل الطلب"),
      body: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          return state.orderDetails.when(
            init: () => Container(),
            loading: () => const Center(
              child: CircularProgressIndicator(),
            ),
            loaded: (data) => SingleChildScrollView(
              child: Padding(
                padding: REdgeInsetsDirectional.all(15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    RichText(
                      text: TextSpan(
                        text: ' رقم الطلب :  ',
                        style: context.textTheme.titleMedium!.copyWith(
                            color: context.colorScheme.tertiaryContainer),
                        children: [
                          TextSpan(
                            text: data.number,
                            style: context.textTheme.bodyMedium!.copyWith(
                              color: context.colorScheme.inversePrimary,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    10.verticalSpace,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'تاريخ الطلب : ',
                          style: context.textTheme.titleMedium!.copyWith(
                            color: context.colorScheme.tertiaryContainer,
                          ),
                        ),
                        RichText(
                          text: TextSpan(
                            text: data.address,
                            style: context.textTheme.titleSmall!.copyWith(
                              color: context.colorScheme.tertiaryContainer,
                            ),
                          ),
                        ),
                      ],
                    ),
                    10.verticalSpace,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '  التكلفة : ',
                          style: context.textTheme.titleMedium!.copyWith(
                            color: context.colorScheme.tertiaryContainer,
                          ),
                        ),
                        Text(
                         "${data.deliveryCost}",
                          style: context.textTheme.titleSmall!.copyWith(
                              color: context.colorScheme.tertiaryContainer),
                        )
                      ],
                    ),
                    10.verticalSpace,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'الإجمالي',
                          style: context.textTheme.titleMedium!.copyWith(
                            color: context.colorScheme.tertiaryContainer,
                          ),
                        ),
                        Text(
                          '${HelperFunctions.formatPrice(data.finalCost??0)} ل.س ',
                          style: context.textTheme.titleMedium!
                              .copyWith(color: context.colorScheme.shadow),
                        )
                      ],
                    ),
                    10.verticalSpace,
                    SizedBox(
                      height: data.products?.length == 2 || data.products?.length == 1
                          ? 200
                          : 300.h,
                      child: ListView.builder(
                        itemBuilder: (context, index) => ItemOrder(
                          padding: true,
                          item: data.products![index],
                        ),
                        itemCount: data.products?.length,
                      ),
                    ),
                    10.verticalSpace,
                    // CardInfoRecive(orderDetails: data),
                    10.verticalSpace,
                    // !widget.orderDetailsParam.orderType
                    //     ? const SizedBox.shrink()
                    //     : state.orders.data.firstWhereOrNull((element) =>
                    //                 element.id ==
                    //                 widget.orderDetailsParam.id) ==
                    //             null
                    //         ? const SizedBox.shrink()
                    //         : RPadding(
                    //             padding: const EdgeInsets.only(top: 10),
                    //             child: AppElevatedButton(
                    //               onPressed: () => context.pushNamed(
                    //                   OrderTrackingPage.name,
                    //                   extra: widget.orderDetailsParam.id),
                    //               text: "تتبع الطلبية",
                    //             ),
                    //           )
                  ],
                ),
              ),
            ),
            empty: () => const EmptyScreen(),
            error: (exception, message) => ErrorScreen(
              onRefresh: () {
                context
                    .read<HomeBloc>()
                    .add(GetOrderDetailsEvent(orderDetailsParams: OrderDetailsParams(id:widget.orderDetailsParam.id,userId:LoginScreen.userId )));

              },
            ),
          );
        },
      ),
    );
  }
}

// class OrderDetailsParams {
//   final String id;
//   final bool orderType;
//
//   OrderDetailsParams(this.id, this.orderType);
// }

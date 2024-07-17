import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:remy/core/utils/extensions/build_context.dart';
import 'package:remy/feature/app/auth/presentation/ui/screen/login_screen.dart';
import 'package:remy/feature/app/home/presentation/bloc/auth_bloc.dart';

import '../../../../presentation/widgets/app_scaffold.dart';
import '../../../../presentation/widgets/app_text.dart';
import '../../../domain/use_case/get_order_usecase.dart';
import '../widget/order_tab.dart';



class OrderPage extends StatefulWidget {
  const OrderPage({super.key});
  static const path = "order";
  static const name = "order";
  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  int currentIndex = 0;
  void initState() {
    // TODO: implement initState
    super.initState();

  }
  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      backgroundColor: context.colorScheme.onPrimary,
      // appBar: AppBarWidget(context: context, title: "طلباتي"),
      body: DefaultTabController(
        initialIndex: 0,
        length: 3,
        child: Column(
          children: [
            TabBar(
              onTap: (index) {
                currentIndex = index;
              },
              unselectedLabelColor: context.colorScheme.outline,
              labelColor: context.colorScheme.primary,
              indicatorSize: TabBarIndicatorSize.tab,
              labelPadding: REdgeInsets.symmetric(horizontal: 30),
              labelStyle: context.textTheme.titleSmall,
              tabs: [
                Tab(child: AppText('الطلبات النشطة')),
                Tab(child: AppText('الطلبات السابقة')),
                Tab(child: AppText('الطلبات الغير مؤكدة')),
              ],
            ),
            10.verticalSpace,
            const Expanded(
              child: TabBarView(
                children: [
                  OrderTap(
                    orderType: "Active",
                  ),
                  OrderTap(
                    orderType: 'Previous',
                  ),
                  OrderTap(
                    orderType: 'NotConfirmed',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

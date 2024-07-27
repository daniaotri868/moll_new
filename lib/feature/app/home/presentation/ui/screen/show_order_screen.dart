import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
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
      appBar:  AppBar(
        toolbarHeight: 100,
        title: AppText("تفاصيل الطلب",              style: context.textTheme.headlineMedium?.copyWith(fontWeight: FontWeight.bold,color: context.colorScheme.primary),
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

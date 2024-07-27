import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:remy/core/config/theme/app_theme.dart';
import 'package:remy/core/utils/extensions/build_context.dart';
import 'package:remy/feature/app/auth/presentation/ui/screen/login_screen.dart';
import 'package:remy/feature/app/presentation/widgets/app_text.dart';

import '../../../../../../common/models/page_state/result_builder.dart';
import '../../../../presentation/pages/empty_screen.dart';
import '../../../../presentation/pages/error_screen.dart';
import '../../../../presentation/pages/loading_screen.dart';
import '../../../domain/use_case/get_point_usecase.dart';
import '../../bloc/auth_bloc.dart';

class MyPointPage extends StatefulWidget {
  static String name="MyPointPage";
  const MyPointPage({super.key});

  @override
  State<MyPointPage> createState() => _MyPointPageState();
}

class _MyPointPageState extends State<MyPointPage> {
  @override
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<HomeBloc>().add(MyPointEvent(getOrderParams:MyPointParams(userId: LoginScreen.userId) ));
  }
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(
        toolbarHeight: 90,
        title: AppText("نقاطي",              style: context.textTheme.headlineMedium?.copyWith(fontWeight: FontWeight.bold,color: context.colorScheme.primary),
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
      body: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          return PageStateBuilder(
              init: const SizedBox.shrink(),
              success: (data) =>
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListView.separated(
                      separatorBuilder: (context, index) => 5.verticalSpace,
                      itemBuilder: (context, index) =>Container(
                        padding: EdgeInsets.all(10),
                        height: 100,
                        decoration: BoxDecoration(
                          color: Colors.white,
                           boxShadow: [
                            BoxShadow(color: Color(0x0F101828), offset: Offset(0, 1), blurRadius: 2),
                      // BoxShadow(color: Color(0x1A101828), offset: Offset(0, 1), blurRadius: 3),
                      ],
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            AppText("  اسم المول : الفرقان"),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                AppText(" عدد النقاط : 3"),
                                AppText("قيمة النقاط : 300"),

                              ],
                            )
                          ],
                        ),
                      ),
                      itemCount:5,
                    ),
                  ),
              loading: const LoadingScreen(),
              error: (error) =>
                  ErrorScreen(
                    onRefresh: () {
                      context.read<HomeBloc>().add(MyPointEvent(getOrderParams:MyPointParams(userId: LoginScreen.userId) ));
                      // print(LoginScreen.userId);
                    },
                  ),
              result: state.getMyPoints,
              empty: const EmptyScreen());
        },
      ),
    );
  }
}

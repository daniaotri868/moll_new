import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../common/models/page_state/result_builder.dart';
import '../../../../presentation/pages/empty_screen.dart';
import '../../../../presentation/pages/error_screen.dart';
import '../../../../presentation/pages/loading_screen.dart';
import '../../../../presentation/widgets/app_text.dart';
import '../../bloc/auth_bloc.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({super.key});

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                          boxShadow: [
                            BoxShadow(color: Color(0x0F101828), offset: Offset(0, 1), blurRadius: 2),
                            // BoxShadow(color: Color(0x1A101828), offset: Offset(0, 1), blurRadius: 3),
                          ],
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            AppText(" العنوان"),
                            AppText("التفاصيل"),
                          ],
                        )
                      ),
                      itemCount:5,
                    ),
                  ),
              loading: const LoadingScreen(),
              error: (error) =>
                  ErrorScreen(
                    onRefresh: () {
                      // context.read<HomeBloc>().add(MyPointEvent(getOrderParams:MyPointParams(userId: LoginScreen.userId) ));
                      // print(LoginScreen.userId);
                    },
                  ),
              result: state.getMyPoints,
              empty: const EmptyScreen()
          );
        },
      ),
    );
  }
}

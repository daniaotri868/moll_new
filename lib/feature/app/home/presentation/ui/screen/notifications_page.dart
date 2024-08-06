import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:remy/common/models/page_state/result_builder.dart';
import 'package:remy/core/utils/extensions/build_context.dart';
import 'package:remy/feature/app/auth/presentation/ui/screen/login_screen.dart';
import 'package:remy/feature/app/home/presentation/bloc/auth_bloc.dart';
import '../../../../../../core/di/di_container.dart';
import '../../../../presentation/pages/empty_screen.dart';
import '../../../../presentation/pages/error_screen.dart';
import '../../../../presentation/pages/loading_screen.dart';
import '../../../../presentation/widgets/app_scaffold.dart';
import '../../../../presentation/widgets/app_text.dart';
import '../../../domain/use_case/notifications_use_case.dart';

class NotificationsPage extends StatefulWidget {
static String get name => "/NotificationsPage";
static String get path => "/NotificationsPage";
const NotificationsPage({super.key});

  @override
  State<NotificationsPage> createState() => _NotificationsPageState();
}

class _NotificationsPageState extends State<NotificationsPage> {
  late final HomeBloc bloc;
  @override
  void initState() {
    bloc = getIt<HomeBloc>();
    super.initState();
  }
@override
Widget build(BuildContext context) {
return  AppScaffold(
  appBar: AppBar(),
  body:BlocProvider(
    create: (context) => bloc..add(NotificationsEvent(notificationsParam: NotificationsParam(userId:LoginScreen.userId ))),
  lazy:false,
  child: BlocBuilder<HomeBloc, HomeState>(
  builder: (context, state) {
    return PageStateBuilder(
        init: const SizedBox.shrink(),
        loading: const LoadingScreen(),
        error: (error) =>
            ErrorScreen(
              onRefresh: () {
                // context.read<HomeBloc>().add(MyPointEvent(getOrderParams:MyPointParams(userId: LoginScreen.userId) ));
                // print(LoginScreen.userId);
              },
            ),
        result: state.notifications,
        empty: const EmptyScreen(),
      success: (data) =>ListView.builder(
        itemCount: data.length,
        itemBuilder: (BuildContext context, int index) {
          return NotificationCard(title: data[index].title??"", body: data[index].body ?? "",);
        },
      )
    );
  },
),
),
);
}
}





class NotificationCard extends StatelessWidget {
  const NotificationCard({
    super.key,
    required this.title,
    required this.body,
  });
  final String title;
  final String body;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        // margin: REdgeInsets.only(bottom: 20),
        margin:REdgeInsetsDirectional.only(
            start: 24.w, end: 24.w, top: 10.h) ,
        height: 130.h,
        child: Stack(
          children: [
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                height: 111.h,
                padding: REdgeInsets.only(
                  top: 28,
                  left: 16,
                  right: 16,
                ),
                decoration: BoxDecoration(
                  // boxShadow: context.boxShadows,
                  color: context.colorScheme.surface,
                  borderRadius: BorderRadius.circular(12.r),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppText(title,),
                    10.verticalSpace,
                    AppText(
                      body,
                      maxLines: 2,
                      // color: context.colorScheme.outline,
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: Container(
                height: 38.r,
                width: 38.r,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: context.colorScheme.surface,
                  // boxShadow: context.boxShadows,
                ),
                child: Center(
                  child: SvgPicture.asset(
                  "assets/image/Notification.svg",
                    color: context.colorScheme.primary,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
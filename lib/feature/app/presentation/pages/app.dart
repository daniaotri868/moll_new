import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '../../../../common/constants/constants.dart';
import '../../../../core/config/routing/router.dart';
import '../../../../core/config/theme/app_theme.dart';
import '../../../../services/service_provider.dart';
import '../bloc/app_manager_cubit.dart';

class App extends StatelessWidget {
  const App({super.key});
  static final GlobalKey<NavigatorState> navKey = GlobalKey<NavigatorState>();
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      useInheritedMediaQuery: true,
      designSize: designSize,
      builder: (context, child) => GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: FocusManager.instance.primaryFocus?.unfocus,
        child: ServiceProvider(
          child: BlocBuilder<AppManagerCubit, AppManagerState>(
            builder: (context, state) {
              return MaterialApp.router(
                title: "Fly Food App",
                debugShowCheckedModeBanner: false,
                theme: AppTheme.light(context),
                darkTheme: AppTheme.dark(context),
                routerConfig: GRouter.router,
                locale: context.locale,
                localizationsDelegates: context.localizationDelegates,
                supportedLocales: context.supportedLocales,

              );
            },
          ),
        ),
      ),
    );
  }
}

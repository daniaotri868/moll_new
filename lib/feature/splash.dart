import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:remy/core/utils/extensions/build_context.dart';
import 'package:remy/feature/app/presentation/widgets/app_elvated_button.dart';

import 'auth/presentation/pages/login.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> with TickerProviderStateMixin {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colorScheme.primary,
      body: Stack(
        children: [
          Positioned(
              bottom: 0,
              child: Image.asset('assets/image/splash.png')),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Expanded(
                flex: 3,
                child: Padding(
                  padding: REdgeInsetsDirectional.only(end: 30.w,start: 182.w,top: 100.h),
                  child: const Text(
                    "login in bla bla bla",
                    maxLines: 3,
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                ),
              ),
             Expanded(
               child: Padding(
                 padding: REdgeInsetsDirectional.only(start: 43.w,end: 43.w),
                 child: Column(
                   children: [
                     AppElevatedButton(
                     style: ElevatedButton.styleFrom(
                         backgroundColor: context.colorScheme.primary
                     ),
                     onPressed: () {
                    context.pushNamed(LoginPage.path);

                     },
                     child: const Text("تسجيل دخول"),
                   ),
                     35.verticalSpace,
                     AppElevatedButton(
                       style: ElevatedButton.styleFrom(
                           backgroundColor: context.colorScheme.onPrimary
                       ),
                       child: Text("إنشاء حساب",style: TextStyle(
                           color: context.colorScheme.primary
                       )),
                       onPressed: () {

                       },
                     ),
                   ],
                 ),
               ),
             )
              // 50.verticalSpace,
            ],
          )
        ],
      )

    );
  }
}

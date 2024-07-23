import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:remy/core/config/routing/router.dart';
import 'package:remy/core/config/theme/app_theme.dart';
import 'package:remy/core/utils/extensions/build_context.dart';
import 'package:remy/feature/app/home/presentation/ui/screen/profile_page.dart';
import 'package:remy/feature/app/home/presentation/ui/screen/profile_screen.dart';
import 'package:remy/feature/app/home/presentation/ui/screen/show_order_screen.dart';
import 'package:remy/feature/app/presentation/widgets/app_text.dart';

class Setting extends StatefulWidget {
  const Setting({super.key});

  @override
  State<Setting> createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            100.verticalSpace,
           InkWell(
             onTap: () {
               context.pushNamed(ProfileScreen.name);
             },
             child: Container(
               height: 50,
               width: double.infinity,
               decoration: BoxDecoration(
                 borderRadius: BorderRadius.circular(10),
                 color: context.colorScheme.primary.withOpacity(0.9),
               ),
               child: Center(child: AppText("الملف الشخصي",style: TextStyle(color: Colors.white),)),
             ),
           ),
           10.verticalSpace,
           InkWell(
             onTap: () {
               context.pushNamed(OrderPage.name);
             },
             child: Container(
               height: 50,
               width: double.infinity,
               decoration: BoxDecoration(
                 borderRadius: BorderRadius.circular(10),
                 color: context.colorScheme.primary.withOpacity(0.9),
               ),
               child: Center(child: AppText("الطلبات",style: TextStyle(color: Colors.white),)),
             ),
           ),
          ],
        ),
      ),
    );
  }
}

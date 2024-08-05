import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:remy/core/utils/extensions/build_context.dart';
import 'package:remy/feature/app/home/presentation/ui/widget/home_app_bar.dart';

import '../../../../presentation/widgets/app_text.dart';

class AboutScreen extends StatefulWidget {
  static String name="AboutScreen";
  const AboutScreen({super.key});

  @override
  State<AboutScreen> createState() => _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 90,
        title: AppText("حول التطبيق",              style: context.textTheme.headlineMedium?.copyWith(fontWeight: FontWeight.bold,color: context.colorScheme.primary),
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
      ) ,
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(Icons.circle_outlined,size: 10,),
                  2.horizontalSpace,
                  AppText("تطبيق يسمح لك بالشراء من أي مول تريده "),
                ],
              ),
              7.verticalSpace,

              Row(
                children: [
                  Icon(Icons.circle_outlined,size: 10,),
                  2.horizontalSpace,
                  AppText("و لديه ميزة التوصيل"),
                ],
              ),
              7.verticalSpace,

              Row(
                children: [
                  Icon(Icons.circle_outlined,size: 10,),
                  2.horizontalSpace,
                  AppText("يسمح لك بتتبع الطلبية (أي وصلت لأي مرحلة)"),
                ],
              ),
              7.verticalSpace,

              Row(
                children: [
                  Icon(Icons.circle_outlined,size: 10,),
                  2.horizontalSpace,
                  AppText(" توجد ميزة النقاط عند شرائك لكميات كبيرة تحصل على نقاط "),
                ],
              ),
              7.verticalSpace,
              Row(
                children: [
                  Icon(Icons.circle_outlined,size: 10,),
                  2.horizontalSpace,
                  AppText(" نقاطك ستفيدك في الحصول على حسم عن شرائك للمنتجات"),
                ],
              ),
              7.verticalSpace,
              Row(
                children: [
                  Icon(Icons.circle_outlined,size: 10,),
                  2.horizontalSpace,
                  AppText(" تستطيع التقديم طلب ان تكون سائق"),
                ],
              ),
              7.verticalSpace,
              Row(
                children: [
                  Icon(Icons.circle_outlined,size: 10,),
                  2.horizontalSpace,
                  AppText(" إمكانك وضع منتحاتك ضمن المفضلة للعودة لهم لاحقا"),
                ],
              ),
              Row(
                children: [
                  Icon(Icons.circle_outlined,size: 10,),
                  2.horizontalSpace,
                  Row(
                    children: [
                      AppText(" و نعمل على تطويره   "),
                      AppText(" ......."),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

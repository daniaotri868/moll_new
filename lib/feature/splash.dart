import 'package:flutter/material.dart';
import 'package:remy/core/utils/extensions/build_context.dart';
import 'package:remy/feature/app/presentation/widgets/app_elvated_button.dart';
import 'package:remy/feature/app/presentation/widgets/app_text_field.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AppElevatedButton(
              child: const Text("تسجيل دخول"),
              onPressed: () {},
            ),
            AppElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: context.colorScheme.onPrimary),
              child: Text("إنشاء حساب", style: TextStyle(color: context.colorScheme.primary)),
              onPressed: () {},
            ),
            AppTextField(
              name: "dasd",
            ),
          ],
        ),
      ],
    ));
  }
}

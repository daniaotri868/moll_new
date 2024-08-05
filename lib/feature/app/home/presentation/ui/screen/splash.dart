import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:remy/core/config/routing/router.dart';
import 'package:remy/core/utils/extensions/build_context.dart';
import 'package:remy/feature/app/presentation/widgets/app_text.dart';

import 'boarding_screen.dart';

class SplashPage extends StatefulWidget {
  static String name="/SplashPage";
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colorScheme.primary,
      body: InkWell(
        onTap: () {
          context.goNamed(GRouter.config.authRoutes.login);
        },
        child: Center(
          child: SvgPicture.asset('assets/image/sp.svg'),
        ),
      ),
    );
  }
}

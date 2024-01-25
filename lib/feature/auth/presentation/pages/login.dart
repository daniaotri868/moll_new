import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:remy/core/utils/extensions/build_context.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colorScheme.primary,
      body:Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.r)
        ),
        child: const Column(
          children: [
            
          ],
        ),
      ) ,

    );
  }
}

import 'package:flutter/material.dart';
import 'package:remy/core/utils/extensions/build_context.dart';
import 'package:remy/feature/app/presentation/widgets/app_text_field.dart';

class LoginPage extends StatelessWidget {
  static const path="/loginPage";
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colorScheme.primary,
      body:Container(
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
            topRight: Radius.circular(20),
            topLeft: Radius.circular(20)
          ),
          color: context.colorScheme.onPrimary
        ),
        child:  Column(
          children: [
            Image.asset('assets/image/login_page.png'),
             // 94.v
             AppTextField(
                prefixIcon: Icon(Icons.email,color: context.colorScheme.primary),
                name: "name",
             ),
             const AppTextField(
               prefixIcon: Icon(Icons.lock),
              name: "phone",
            ),
          ],
        ),
      ) ,

    );
  }
}

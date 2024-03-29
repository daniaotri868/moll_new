import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:remy/common/constants/app_string.dart';
import 'package:remy/core/utils/extensions/build_context.dart';
import 'package:remy/feature/app/presentation/widgets/app_date_picker.dart';
import 'package:remy/feature/app/presentation/widgets/app_elvated_button.dart';
import 'package:remy/feature/app/presentation/widgets/app_text_field.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colorScheme.primary,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: context.fullWidth,
              height: context.fullHeight * 0.2,
              color: context.colorScheme.primary,
            ),
            Container(
              decoration: BoxDecoration(
                color: context.colorScheme.onPrimary,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(46.r),
                  topRight: Radius.circular(46.r),
                ),
              ),
              child: Padding(
                padding: EdgeInsets.only(top: 35.r, right: 47.r, left: 47.r),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      AppString.signUp,
                      style: Theme.of(context).textTheme.displaySmall?.copyWith(fontWeight: FontWeight.bold),
                    ),
                    45.verticalSpace,
                    AppTextField(
                      name: "firstName",
                      title: AppString.firstName,
                      prefixIcon: Icon(
                        Icons.person,
                        color: context.colorScheme.primary,
                      ),
                    ),
                    45.verticalSpace,
                    AppTextField(
                      name: "lastName",
                      title: AppString.lastName,
                      prefixIcon: Icon(
                        Icons.person,
                        color: context.colorScheme.primary,
                      ),
                    ),
                    45.verticalSpace,
                    AppTextField(
                      name: "email",
                      title: AppString.email,
                      prefixIcon: Icon(
                        Icons.email,
                        color: context.colorScheme.primary,
                      ),
                    ),
                    45.verticalSpace,
                    AppDatePicker(
                      name: "birthdate",
                      title: AppString.birthdate,
                      prefixIcon: Icon(
                        Icons.date_range_outlined,
                        color: context.colorScheme.primary,
                      ),
                    ),
                    43.verticalSpace,
                    AppTextField(
                      name: "password",
                      title: AppString.password,
                      obscure: true,
                      isPasswordFiled: true,
                      prefixIcon: Icon(
                        Icons.lock,
                        color: context.colorScheme.primary,
                      ),
                    ),
                    50.verticalSpace,
                    AppElevatedButton(
                      child: const Text(AppString.next),
                      onPressed: () {},
                    ),
                    21.verticalSpace,
                    SizedBox(
                      width: context.fullWidth,
                      child: Column(
                        children: [
                          const Text(AppString.doYouHaveAccount),
                          TextButton(
                            onPressed: () {},
                            child: Text(
                              AppString.signUp,
                              style: TextStyle(color: context.colorScheme.primary),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

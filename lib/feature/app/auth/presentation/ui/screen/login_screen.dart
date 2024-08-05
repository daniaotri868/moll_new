import 'dart:io';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:go_router/go_router.dart';
import 'package:remy/common/constants/app_string.dart';
import 'package:remy/core/config/routing/router.dart';
import 'package:remy/core/di/di_container.dart';
import 'package:remy/core/utils/extensions/build_context.dart';
import 'package:remy/feature/app/presentation/widgets/app_elvated_button.dart';
import 'package:remy/feature/app/presentation/widgets/app_text_field.dart';

import '../../bloc/auth_bloc.dart';

class LoginScreen extends StatelessWidget {
  static String userId="";
   LoginScreen({super.key});

  @override
  TextEditingController email=TextEditingController();
  TextEditingController password =TextEditingController();
  final formKey = GlobalKey<FormState>();

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colorScheme.primary,
      body: SingleChildScrollView(
        child: Form(
          key:formKey ,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                width: context.fullWidth,
                height: context.fullHeight * 0.4,
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
                        AppString.login,
                        style: Theme.of(context).textTheme.displaySmall?.copyWith(fontWeight: FontWeight.bold),
                      ),
                      45.verticalSpace,
                      AppTextField(
                        name: "email",
                        controller:email ,
                        title: AppString.email,
                       textInputType:TextInputType.emailAddress,
                        validator:FormBuilderValidators.email(),
                        prefixIcon: Icon(
                          Icons.email,
                          color: context.colorScheme.primary,
                        ),
                      ),
                      43.verticalSpace,
                      AppTextField(
                        name: "password",
                        title: AppString.password,
                        obscure: true,
                        validator: FormBuilderValidators.password(),
                        controller: password,
                        isPasswordFiled: true,
                        prefixIcon: Icon(
                          Icons.lock,
                          color: context.colorScheme.primary,
                        ),
                      ),
                      50.verticalSpace,
                      AppElevatedButton(
                        child: const Text(AppString.next),
                        onPressed: () async{

    if (formKey.currentState!.validate()) {

         // await Firebase.initializeApp();

      FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance; // Change here
      _firebaseMessaging.getToken().then((token){
        print(token);
        context.read<AuthBloc>().add(RegisterEvent(
          email: email.text,
          password: password.text,
          deviceToken: token??"",
          onSuccess: () {
            context.goNamed(GRouter.config.homeRoutes.homeScreen);
          },
        ));
      });
      DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
      String _deviceID = '';
      if (Platform.isIOS) {
        // import 'dart:io'
        var iosDeviceInfo = await deviceInfo.iosInfo;
        _deviceID = iosDeviceInfo.identifierForVendor!;

        // unique ID on iOS
      } else if (Platform.isAndroid) {
        var androidDeviceInfo = await deviceInfo.androidInfo;
        _deviceID = androidDeviceInfo.id;
      }


      print(_deviceID);

    }

                        },
                      ),
                      21.verticalSpace,
                      SizedBox(
                        width: context.fullWidth,
                        child: Column(
                          children: [
                            const Text(AppString.doYouHaveAccount),
                            TextButton(
                              onPressed: () {
                                context.goNamed(GRouter.config.authRoutes.signUp);

                              },
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
      ),
    );
  }
}

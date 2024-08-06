import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:go_router/go_router.dart';
import 'package:remy/common/constants/app_string.dart';
import 'package:remy/common/models/page_state/page_state.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:remy/core/utils/extensions/build_context.dart';
import 'package:remy/feature/app/auth/presentation/bloc/auth_bloc.dart';
import 'package:remy/feature/app/presentation/widgets/app_date_picker.dart';
import 'package:remy/feature/app/presentation/widgets/app_elvated_button.dart';
import 'package:remy/feature/app/presentation/widgets/app_text_field.dart';

import '../../../../../../common/models/page_state/result_builder.dart';
import '../../../../../../core/config/routing/router.dart';
import '../../../../home/presentation/bloc/auth_bloc.dart';
import '../../../../presentation/pages/empty_screen.dart';
import '../../../../presentation/pages/error_screen.dart';
import '../../../../presentation/pages/loading_screen.dart';
import '../../../../presentation/widgets/app_drop_down.dart';
import '../../../data/model/all_area.dart';

class SignupScreen extends StatefulWidget {
   SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // context.read<AuthBloc>().add(AllAreaEvent());
  }
  @override
  TextEditingController firstName=TextEditingController();

  TextEditingController lastName=TextEditingController();

  TextEditingController email=TextEditingController();

  TextEditingController addressController =TextEditingController();
  TextEditingController phoneController =TextEditingController();

  TextEditingController oldPassword =TextEditingController();
  TextEditingController mony =TextEditingController();
  final formKey = GlobalKey<FormState>();

  String ?idArea="" ;

  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
  builder: (context, state) {
    return Scaffold(
      backgroundColor: context.colorScheme.primary,
      body: SingleChildScrollView(
        child: Form(
        key: formKey,
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
                        textCapitalization: TextCapitalization.words,
                        controller: firstName,
                        title: AppString.firstName,
                        validator: FormBuilderValidators.required(),
                        prefixIcon: Icon(
                          Icons.person,
                          color: context.colorScheme.primary,
                        ),
                      ),
                      45.verticalSpace,
                      AppTextField(
                        name: "lastName",
                        textInputType:TextInputType.text,
                        controller: lastName,

                        title: AppString.lastName,
                        validator: FormBuilderValidators.minWordsCount(1),
                        prefixIcon: Icon(
                          Icons.person,
                          color: context.colorScheme.primary,
                        ),
                      ),
                      45.verticalSpace,
                      AppTextField(
                        name: "email",
                        controller: email,
                        textInputType:TextInputType.text,
                        title: AppString.email,
                        validator: FormBuilderValidators.email(),
                        prefixIcon: Icon(
                          Icons.email,
                          color: context.colorScheme.primary,
                        ),
                      ),
                      45.verticalSpace,
                      AppTextField(
                        name: "phone",
                        textInputType:TextInputType.number,
                        controller: phoneController,
                        title: "رقم الهاتف",

                        validator: FormBuilderValidators.equal(10),

                        prefixIcon: Icon(
                          Icons.phone,
                          color: context.colorScheme.primary,
                        ),
                      ),
                      45.verticalSpace,
                      AppTextField(
                        name: "Address",
                        controller: addressController,
                        title: "العنوان",
                        textInputType:TextInputType.text,
                        validator: FormBuilderValidators.required(),
                        prefixIcon: Icon(
                          Icons.location_history,
                          color: context.colorScheme.primary,
                        ),
                      ),
                      43.verticalSpace,
                      AppTextField(
                        name: " password",
                        title: AppString.password,
                        obscure: true,
                        controller: oldPassword,
                        validator: FormBuilderValidators.password(minLength: 5),

                        isPasswordFiled: true,
                        prefixIcon: Icon(
                          Icons.lock,
                          color: context.colorScheme.primary,
                        ),
                      ),
                      20.verticalSpace,
                      AppTextField(
                        name: "المحفظة",
                        title: "المحفظة",
                        // obscure: true,
                        controller: mony,
                        validator: FormBuilderValidators.phoneNumber(),

                        // validator: FormBuilderValidators.password(minLength: 5),

                        // isPasswordFiled: true,
                        prefixIcon: Icon(
                          Icons.monetization_on_sharp,
                          color: context.colorScheme.primary,
                        ),
                      ),
                      20.verticalSpace,
                  // PageStateBuilder(
                  //     init: const SizedBox.shrink(),
                  //     success: (data) => AppDropDownMenu(
                  //         hint: "أختر منطقة",
                  //         onChange: (value) {
                  //           idArea=value.id;
                  //           print(idArea);
                  //         },
                  //         // border: Border(top: BorderSide(color: Colors.cyan,width: 2)),
                  //         // hintText: "اختر يوم",
                  //         // initialValue:day[1],
                  //         // value: _selectedValueCategoryMain,
                  //         // onChanged: (value) {
                  //         //   setState(() {
                  //         //     context.read<CartBloc>().add(DaySelectEvent(id:value?.id ));
                  //         //     _selectedValueCategoryMain = value;
                  //         //   });
                  //         // },
                  //         items: data
                  //     ),
                  //     loading: const LoadingScreen(),
                  //     error: (error) =>  ErrorScreen(onRefresh: () {
                  //       context.read<AuthBloc>().add(AllAreaEvent());
                  //
                  //     },),
                  //     result: state.listArea,
                  //     empty: const EmptyScreen()),
                  //     50.verticalSpace,
                      AppElevatedButton(
                        isLoading: state.checkCodeStatus.isLoading(),
                        child: const Text(AppString.next),
                        onPressed: () async{
              if (formKey.currentState!.validate()||idArea=="") {
                FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance; // Change here
                _firebaseMessaging.getToken().then((token){
                  print(token);
                  context.read<AuthBloc>().add(CheckCodeEvent(
                    FirstName: firstName.text,
                    LastName: lastName.text,
                    PhoneNumber: phoneController.text,
                    DeviceToken: token??"",
                    Email: email.text,
                    Password: oldPassword.text,
                    Image: "",
                    Address:addressController.text ,
                    AreaId: idArea??"",
                    Wallet: double.parse("${mony.text}"),
                    onSuccess: () {
                      context.goNamed(GRouter.config.homeRoutes.homeScreen);
                    },
                  ));
                });
                // if(idArea!=''){
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

                  print("kkkkkkkkkkkkkkkkkkkkkkkk");

                  print(_deviceID);



                // }else
                //   {
                //     Fluttertoast.showToast(
                //         msg: "ادخل المنطقة",
                //         toastLength: Toast.LENGTH_SHORT,
                //         gravity: ToastGravity.BOTTOM,
                //         timeInSecForIosWeb: 1,
                //         backgroundColor:  Colors.black,
                //         textColor: Colors.white,
                //         fontSize: 16.0);
                //   }
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
  },
);
  }
}

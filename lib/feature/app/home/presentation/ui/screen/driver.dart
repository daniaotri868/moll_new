import 'package:file_picker/file_picker.dart';
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
import 'package:flutter/widgets.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:remy/core/utils/extensions/build_context.dart';
import 'package:remy/feature/app/auth/presentation/bloc/auth_bloc.dart';
import 'package:remy/feature/app/auth/presentation/ui/screen/login_screen.dart';
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
import '../../../../presentation/widgets/app_text.dart';
import '../../../domain/use_case/department_details_use_case.dart';
import '../../../domain/use_case/driver_usecase.dart';

class Driver extends StatefulWidget {
  Driver({super.key});

  @override
  State<Driver> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<Driver> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<HomeBloc>().add(GetMollNameEvent(detailsParams:DetailsParams(userId: LoginScreen.userId) ));
  }
  @override
  TextEditingController firstName=TextEditingController();

  TextEditingController lastName=TextEditingController();

  TextEditingController email=TextEditingController();

  TextEditingController addressController =TextEditingController();
  TextEditingController phoneController =TextEditingController();

  TextEditingController oldPassword =TextEditingController();
  final formKey = GlobalKey<FormState>();

  String ?idArea="" ;
  String ?path="" ;

  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: context.colorScheme.primary,
          appBar: AppBar(
            toolbarHeight: 70,
            title: AppText("هل تريد أن تكون سائقا؟",              style: context.textTheme.headlineMedium?.copyWith(fontWeight: FontWeight.bold,color: context.colorScheme.primary),
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
          ),
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
                            validator: FormBuilderValidators.required(),
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

                            validator: FormBuilderValidators.phoneNumber(),

                            prefixIcon: Icon(
                              Icons.email,
                              color: context.colorScheme.primary,
                            ),
                          ),
                          45.verticalSpace,
                          InkWell(
                            onTap: () async{
                              FilePickerResult? result = await FilePicker.platform.pickFiles();

                              if (result != null) {
                                File file = File(result.files.single.path!);
                                String? selectedDirectory = await FilePicker.platform.getDirectoryPath();
                                 print("333333333333${selectedDirectory}");
                                setState(() {
                                  path=result.files.single.path!;
                                });
                                print("-----------${file}");
                              } else {
                                // User canceled the picker
                              }
                            },
                            child: Container(
                              height: 50,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: [
                                  BoxShadow(color: Color(0x0F101828), offset: Offset(0, 1), blurRadius: 2),
                                  // BoxShadow(color: Color(0x1A101828), offset: Offset(0, 1), blurRadius: 3),
                                ],
                              ),
                              child: Center(child: Text(path==""?"ارسل ال cv":"تم الاختيار")),
                            ),
                          ),
                          20.verticalSpace,
                          PageStateBuilder(
                              init: const SizedBox.shrink(),
                              success: (data) => AppDropDownMenu(
                                  hint: "أختر مول",
                                  onChange: (value) {
                                    idArea=value.id;
                                    print(idArea);
                                  },
                                  // border: Border(top: BorderSide(color: Colors.cyan,width: 2)),
                                  // hintText: "اختر يوم",
                                  // initialValue:day[1],
                                  // value: _selectedValueCategoryMain,
                                  // onChanged: (value) {
                                  //   setState(() {
                                  //     context.read<CartBloc>().add(DaySelectEvent(id:value?.id ));
                                  //     _selectedValueCategoryMain = value;
                                  //   });
                                  // },
                                  items: data
                              ),
                              loading: const LoadingScreen(),
                              error: (error) =>  ErrorScreen(onRefresh: () {
                                context.read<HomeBloc>().add(GetMollNameEvent(detailsParams:DetailsParams(userId: LoginScreen.userId) ));


                              },),
                              result: state.getAllMollName,
                              empty: const EmptyScreen()),
                          50.verticalSpace,
                          AppElevatedButton(
                            child: const Text("تأكيد"),
                            onPressed: () async{
                              if (formKey.currentState!.validate()||idArea=="") {

                                if(idArea!=''){
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
                                  context.read<HomeBloc>().add(DriverEvent(
                                   driverParams: DriverParams(
                                     FirstName: firstName.text,
                                     LastName: lastName.text,
                                     PhoneNumber: phoneController.text,
                                     Email: email.text,
                                     MallId: idArea??"",
                                     CV: path
                                     // onSuccess: () {
                                     //   context.goNamed(GRouter.config.homeRoutes.homeScreen);
                                     // },
                                   )
                                  ));


                                }else
                                {
                                  Fluttertoast.showToast(
                                      msg: "ادخل المنطقة",
                                      toastLength: Toast.LENGTH_SHORT,
                                      gravity: ToastGravity.BOTTOM,
                                      timeInSecForIosWeb: 1,
                                      backgroundColor:  Colors.black,
                                      textColor: Colors.white,
                                      fontSize: 16.0);
                                }
                              }
                            },
                          ),
                          21.verticalSpace,

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

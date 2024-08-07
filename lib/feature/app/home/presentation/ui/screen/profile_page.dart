import 'dart:io';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:remy/core/utils/extensions/build_context.dart';
import 'package:remy/feature/app/auth/presentation/bloc/auth_bloc.dart';
import 'package:remy/feature/app/auth/presentation/ui/screen/login_screen.dart';
import 'package:remy/feature/app/presentation/widgets/app_text_field.dart';
import '../../../../../../common/models/page_state/result_builder.dart';
import '../../../../presentation/pages/empty_screen.dart';
import '../../../../presentation/pages/error_screen.dart';
import '../../../../presentation/pages/loading_screen.dart';
import '../../../../presentation/widgets/app_elvated_button.dart';
import '../../../../presentation/widgets/app_scaffold.dart';
import '../../../../presentation/widgets/app_text.dart';


class ProfileScreen extends StatefulWidget {
  static String get name => "ProfilePage";
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  late final AuthBloc bloc;
  static final GlobalKey<FormBuilderState> _formKey = GlobalKey<FormBuilderState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController passwordNewController = TextEditingController();
  TextEditingController monyController = TextEditingController();
  final ValueNotifier<File?> selectedImageProf = ValueNotifier(null);
  final ValueNotifier<File?> selectedImage = ValueNotifier(null);
  final formKey = GlobalKey<FormState>();

  @override
  void initState() {

    context.read<AuthBloc>().add(GetProfileEvent(id: LoginScreen.userId));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          toolbarHeight: 90,
          title: AppText("الحساب",              style: context.textTheme.headlineMedium?.copyWith(fontWeight: FontWeight.bold,color: context.colorScheme.primary),
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
        body: Form(
    key: formKey,
          child: BlocBuilder<AuthBloc, AuthState>(
          builder: (context, state) {
          return PageStateBuilder(
                result: state.getUserInfo,
                success: (data) {
                  // passwordController.text=data.firstName??"";
                  phoneController.text=data.phoneNumber??"";
                  emailController.text=data.email??"";
                  monyController.text=data.wallet.toString()??"";
                  return Padding(
                    padding: REdgeInsetsDirectional.only(start: 20, end: 20),
                    child: ListView(
                      children: [
                        // ProfileImageWidget(
                        //   onPressed: () async {
                        //     showModalBottomSheet(
                        //         useSafeArea: true,
                        //         context: context,
                        //         builder: (context) =>
                        //             PickProfileImage(
                        //                 onPickImage: (image) {
                        //               selectedImage.value = image;
                        //               // context.read<ProfileBloc>().add(
                        //               //         ModifyProfileEvent(
                        //               //             modifyProfileParma:
                        //               //                 ModifyProfileParma(
                        //               //       image: image,
                        //               //     )));
                        //             }),
                        //         useRootNavigator: true);
                        //   }, img: Center(
                        //     child: OnTapImage.network(
                        //       img:  data.imageUrl?? "", onTap: () {  },
                        //
                        //     ),
                        //   ),
                        // ),
                        34.verticalSpace,

                        AppText(
                          "تغير رقم الهاتف",
                          textAlign: TextAlign.right,

                        ),
                        10.verticalSpace,
                        AppTextField(
                          controller: phoneController,
                          hintText: "رقم الهاتف",
                          validator: FormBuilderValidators.equal(10),
                          textInputType:TextInputType.number,

                          // suffixIcon: Row(
                          //   crossAxisAlignment: CrossAxisAlignment.center,
                          //   mainAxisAlignment: MainAxisAlignment.end,
                          //   mainAxisSize: MainAxisSize.min,
                          //   children: [
                          //     // const VerticalLineWidget(),
                          //     // GestureDetector(
                          //     //   onTap: () {},
                          //     //   child: AppText(
                          //     //     data.phoneNumber!,
                          //     //     textAlign: TextAlign.left,
                          //     //     style: TextStyle(
                          //     //        color: context.colorScheme.primary,
                          //     //         decoration: TextDecoration.underline,
                          //     //         decorationColor:
                          //     //             context.colorScheme.primary),
                          //     //   ),
                          //     // ),
                          //     30.horizontalSpace,
                          //   ],
                          // ),
                          name: '',
                        ),
                        34.verticalSpace,
                        AppText(
                          " البريد الالكترونى",
                          textAlign: TextAlign.right,
                        ),
                        10.verticalSpace,
                        AppTextField(
                          validator: FormBuilderValidators.email(),
                          textInputType:TextInputType.text,
                          controller: emailController,
                          hintText: data.email!, name: '',
                        ),
                        10.verticalSpace,
                        AppText(
                          " كلمة السر القديمة",
                          textAlign: TextAlign.right,

                        ),
                        10.verticalSpace,
                        AppTextField(
                          controller: passwordController,
                          isPasswordFiled: true,
                          validator: FormBuilderValidators.password(minLength: 5),

                          // prefixIcon: Icon(
                          //   Icons.lock,
                          //   color: context.colorScheme.primary,
                          // ),
                          name: '',
                          // ),
                        ),
                        10.verticalSpace,
                        AppText(
                          " كلمة السر الجديدة",
                          textAlign: TextAlign.right,
                        ),
                        10.verticalSpace,
                        AppTextField(
                          controller: passwordNewController,
                          isPasswordFiled: true,
                          validator: FormBuilderValidators.password(minLength: 5),
                          // prefixIcon: Icon(
                          //   Icons.lock,
                          //   color: context.colorScheme.primary,
                          // ),
                          name: '',
                          // ),
                        ),
                        10.verticalSpace,
                        AppTextField(
                          initialValue: data.wallet.toString(),
                          controller: monyController,
                          textInputType:TextInputType.phone,
                          validator: FormBuilderValidators.phoneNumber(),
                          suffixIcon: Padding(
                              padding: REdgeInsetsDirectional.only(
                                  start: 50.17.w, end: 30.h),
                              child:Icon(Icons.monetization_on_sharp)
                          ), name: '',
                          // ),
                        ),
                        60.verticalSpace,
                        AppElevatedButton(
                          isLoading: state.updateUserInfo.isLoading(),
                          onPressed: () async {
                                        if (formKey.currentState!.validate()) {

                              context.read<AuthBloc>().add(UpdateUserInfoEvent(
                                  wallet:double.parse("${monyController.text}") ,
                                  Email: emailController.text,
                                  PhoneNumber: phoneController.text,
                                  LastName: 'tester',
                                  FirstName: 'tester',
                                  Image: '',
                                  UserId: LoginScreen.userId,
                                  NewPassword: passwordNewController.text,
                                  OldPassword: passwordController.text,
                                  onSuccess: () {
                                   context.pop();
                                  },
                                  DeviceToken: ''
                              ));
                            }
                            // else
                            //   {
                            //     Fluttertoast.showToast(
                            //         msg: "تجاوز مبلغ المحفظة",
                            //         toastLength: Toast.LENGTH_SHORT,
                            //         gravity: ToastGravity.BOTTOM,
                            //         timeInSecForIosWeb: 1,
                            //         backgroundColor:  Colors.black,
                            //         textColor: Colors.white,
                            //         fontSize: 16.0);
                            //   }
                          },
                          child: AppText("تأكيد"),
                        ),
                      ],
                    ),
                  );
                },
            loading: LoadingScreen(),
            error: (error) =>  ErrorScreen(
              onRefresh: () {
                context.read<AuthBloc>().add(GetProfileEvent(id: LoginScreen.userId));
              },
            ),
            empty: EmptyScreen(),
            init: Container(),
              );
            },
          ),
        ));
  }
}

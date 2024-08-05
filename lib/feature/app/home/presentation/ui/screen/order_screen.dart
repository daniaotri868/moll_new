import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:remy/core/config/routing/router.dart';
import 'package:remy/core/config/theme/app_theme.dart';
import 'package:remy/core/utils/extensions/build_context.dart';
import 'package:remy/feature/app/home/presentation/ui/screen/select_location.dart';
import 'package:remy/feature/app/presentation/widgets/app_elvated_button.dart';

import '../../../../../../common/models/page_state/result_builder.dart';
import '../../../../auth/presentation/bloc/auth_bloc.dart';
import '../../../../auth/presentation/ui/screen/login_screen.dart';
import '../../../../presentation/pages/empty_screen.dart';
import '../../../../presentation/pages/error_screen.dart';
import '../../../../presentation/pages/loading_screen.dart';
import '../../../../presentation/widgets/app_drop_down.dart';
import '../../../../presentation/widgets/app_text.dart';
import '../../../../presentation/widgets/app_text_field.dart';
import '../../../domain/use_case/post_order.dart';
import '../../bloc/auth_bloc.dart';
import 'confirm_screen.dart';

class OrderScreen extends StatefulWidget {
  static String name = "OrderScreen";

  const OrderScreen({super.key});

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  List<Map> products=[];

  @override
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<AuthBloc>().add(AllAreaEvent());
    context.read<HomeBloc>().state.listCart?.forEach(
          (element) {
        products.add({
          'id':element.id,
          'quantity':element.qun
        });
      },
    );
  }

  String ?idArea = "";
  TextEditingController controllerNote = TextEditingController();


  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {

        return Scaffold(
          appBar:   AppBar(
            toolbarHeight: 90,
            title: AppText("تأكيد السلة",              style: context.textTheme.headlineMedium?.copyWith(fontWeight: FontWeight.bold,color: context.colorScheme.primary),
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
          body: Padding(
            padding: const EdgeInsets.all(12),
            child: ListView(
              children: [
                InkWell(
                  onTap: () {
                    context.pushNamed(LocationPage.name);
                  },
                  child: Container(
                    height: 60.h,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(color: Color(0x0F101828), offset: Offset(0, 1), blurRadius: 2),
                          // BoxShadow(color: Color(0x1A101828), offset: Offset(0, 1), blurRadius: 3),
                        ],
                        borderRadius: BorderRadius.circular(10),
                        color:context.colorScheme.onPrimary
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(12),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          AppText(LocationPage.selectLocation== LatLng(37.42796133580664, -122.085749655962)?"اختر الموقع":"تم تحديد الموقع بنجاح"),
                          Image.asset("assets/image/svg/send.jpg"),
                        ],
                      ),
                    ),
                  ),
                ),
                30.verticalSpace,
                BlocBuilder<AuthBloc, AuthState>(
                  builder: (context, state) {
                    return PageStateBuilder(
                        init: SizedBox.shrink(),
                        success: (data) =>
                            AppDropDownMenu(
                                hint: "اختر منطقة",
                                onChange: (value) {
                                 setState(() {
                                   idArea = value.id;
                                 });
                                  print(idArea);
                                },

                                // },
                                items: data
                            ),
                        loading: const LoadingScreen(),
                        error: (error) =>
                            ErrorScreen(onRefresh: () {
                              context.read<AuthBloc>().add(AllAreaEvent());
                            },),
                        result: state.listArea,
                        empty: const EmptyScreen());
                  },
                ),
                30.verticalSpace,
                AppTextField(
                  minLines: 5,
                  maxLines: 5,
                  name: "note",
                  controller: controllerNote,
                  title: "اكتب ملاحظاتك",
                  // validator: (text) => text != null && text.length >0
                  //     ? null
                  //     : "ادخل الاسم الاول",
                  // prefixIcon: Icon(
                  //   Icons.person,
                  //   color: context.colorScheme.primary,
                  // ),
                ),

                150.verticalSpace,
                AppElevatedButton(
                    style:  ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                    ),onPressed: () {

                print("-------------${idArea}");
                  context.read<HomeBloc>().add(
                      CreateOrderEvent(createOrderParams: CreateOrderParams(
                        userId: LoginScreen.userId,
                        address: "",
                        products: products,
                        areaId: idArea,
                        lat: LocationPage.selectLocation.latitude,
                        lng: LocationPage.selectLocation.longitude,


                      ),
                      data: (p0) {
                        context.pushNamed(ConfirmScreen.name,extra: p0);
                      },)
                  );
                }, child: AppText("متابعة"))
              ],
            ),
          ),
        );
      },
    );
  }
}

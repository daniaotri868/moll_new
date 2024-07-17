import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:remy/core/config/routing/router.dart';
import 'package:remy/core/config/theme/app_theme.dart';
import 'package:remy/core/utils/extensions/build_context.dart';
import 'package:remy/feature/app/home/presentation/ui/screen/select_location.dart';

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
          appBar:  AppBar(
            title: AppText("تأكيد السلة"),
            centerTitle: true,
          ),
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                BlocBuilder<AuthBloc, AuthState>(
                  builder: (context, state) {
                    return PageStateBuilder(
                        init: SizedBox.shrink(),
                        success: (data) =>
                            AppDropDownMenu(
                                hint: "أختر منطقة",
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
                  name: "note",
                  controller: controllerNote,
                  hintText: "اكتب ملاحظاتك",
                  // validator: (text) => text != null && text.length >0
                  //     ? null
                  //     : "ادخل الاسم الاول",
                  prefixIcon: Icon(
                    Icons.person,
                    color: context.colorScheme.primary,
                  ),
                ),
                30.verticalSpace,
                InkWell(
                  onTap: () {
                    context.pushNamed(LocationPage.name);
                  },
                  child: Container(
                    height: 50.h,
                    width: double.infinity,

                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color:LocationPage.selectLocation== LatLng(37.42796133580664, -122.085749655962)? context.colorScheme.primary.withOpacity(0.7):Colors.blueGrey.withOpacity(0.8)
                    ),
                    child: Center(child: AppText(LocationPage.selectLocation== LatLng(37.42796133580664, -122.085749655962)?"حدد موقعك":"تم نحديد الموقع بنجاح")),
                  ),
                ),
                150.verticalSpace,
                ElevatedButton(onPressed: () {

                print("-------------${idArea}");
                  context.read<HomeBloc>().add(
                      CreateOrderEvent(createOrderParams: CreateOrderParams(
                        userId: LoginScreen.userId,
                        address: "",
                        products: products,
                        areaId: idArea,

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

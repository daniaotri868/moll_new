import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:remy/feature/app/home/presentation/ui/screen/home_screen.dart';
import 'package:remy/feature/app/root/presentation/state/provider/nav_bar_provider.dart';
import 'package:remy/feature/app/root/presentation/ui/widget/root_navbar.dart';

import '../../../../home/presentation/ui/screen/cart_page.dart';
import '../../../../home/presentation/ui/screen/moll_screen.dart';
import '../../../../home/presentation/ui/screen/setting.dart';
import '../../../../home/presentation/ui/screen/show_order_screen.dart';

class RootScreen extends StatelessWidget {
  bool ?edite;
   RootScreen({super.key,this.edite=false});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<NavBarProvider>(
        builder: (context, navProvider, child) => PageView(
          controller: navProvider.pageController,
          physics: const NeverScrollableScrollPhysics(),
          children:  [
            CartPage(),
            MollScreen(),
            HomeScreen(),
            OrderPage(),
            Setting()
          ],
        ),
      ),
      bottomNavigationBar: const RootNavBar(),
    );
  }
}

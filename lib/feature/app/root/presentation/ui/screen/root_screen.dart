import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:remy/feature/app/home/presentation/ui/screen/home_screen.dart';
import 'package:remy/feature/app/root/presentation/state/provider/nav_bar_provider.dart';
import 'package:remy/feature/app/root/presentation/ui/widget/root_navbar.dart';

import '../../../../home/presentation/ui/screen/cart_page.dart';
import '../../../../home/presentation/ui/screen/moll_screen.dart';

class RootScreen extends StatelessWidget {
  const RootScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<NavBarProvider>(
        builder: (context, navProvider, child) => PageView(
          controller: navProvider.pageController,
          physics: const NeverScrollableScrollPhysics(),
          children: const [
            CartPage(),
            MollScreen(),
            HomeScreen(),
            Center(
              child: Text("4"),
            ),
            Center(
              child: Text("5"),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const RootNavBar(),
    );
  }
}

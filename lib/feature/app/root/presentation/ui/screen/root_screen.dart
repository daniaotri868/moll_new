import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:remy/feature/app/root/presentation/state/provider/nav_bar_provider.dart';
import 'package:remy/feature/app/root/presentation/ui/widget/root_navbar.dart';

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
            Center(
              child: Text("1"),
            ),
            Center(
              child: Text("2"),
            ),
            Center(
              child: Text("3"),
            ),
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

import 'package:flutter/material.dart';

class NavBarProvider extends ChangeNotifier {
  late PageController pageController;
  int selectedIndex = 2;
  NavBarProvider() {
    pageController = PageController(initialPage: selectedIndex);
  }

  void changeSelected(int index) {
    pageController.animateToPage(index, duration: const Duration(milliseconds: 700), curve: Curves.easeInOutExpo);
    selectedIndex = index;
    notifyListeners();
  }
}
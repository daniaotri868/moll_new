import 'package:curved_labeled_navigation_bar/curved_navigation_bar.dart';
import 'package:curved_labeled_navigation_bar/curved_navigation_bar_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:remy/core/config/theme/my_color_scheme.dart';
import 'package:remy/core/utils/extensions/build_context.dart';
import 'package:remy/feature/app/root/presentation/state/provider/nav_bar_provider.dart';

class RootNavBar extends StatelessWidget {
  const RootNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return CurvedNavigationBar(
      backgroundColor: context.colorScheme.white,
      color: context.colorScheme.primary,
      buttonBackgroundColor: context.colorScheme.primary,
      index: context.read<NavBarProvider>().selectedIndex,
      onTap: (index) {
        context.read<NavBarProvider>().changeSelected(index);
      },
      items: [
        CurvedNavigationBarItem(
          child: Icon(
            Icons.shopping_cart,
            color: context.colorScheme.white,
          ),
        ),
        CurvedNavigationBarItem(
          child: Icon(
            Icons.dashboard,
            color: context.colorScheme.white,
          ),
        ),
        CurvedNavigationBarItem(
          child: Icon(
            Icons.home,
            color: context.colorScheme.white,
          ),
        ),
        CurvedNavigationBarItem(
          child: Icon(
            Icons.stacked_bar_chart_outlined,
            color: context.colorScheme.white,
          ),
        ),
        CurvedNavigationBarItem(
          child: Icon(
            Icons.favorite,
            color: context.colorScheme.white,
          ),
        ),
      ],
    );
  }
}

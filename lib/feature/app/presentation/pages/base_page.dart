import 'package:flutter/material.dart';

import '../widgets/app_scaffold.dart';

class BasePage extends StatelessWidget {
  const BasePage({
    super.key,
    required this.child,
    required this.bottomNavigationBar,
  });

  final Widget child;
  final Widget bottomNavigationBar;

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      body: child,
      resizeToAvoidBottomInset: false,
      bottomNavigationBar: bottomNavigationBar,
    );
  }
}

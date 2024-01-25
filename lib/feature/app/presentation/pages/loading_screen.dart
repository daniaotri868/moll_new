import 'package:flutter/cupertino.dart';

import '../widgets/loading_indicator.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(child: LoadingIndicator());
  }
}

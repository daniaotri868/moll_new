import 'package:flutter/material.dart';
import '../widgets/app_text.dart';

class ComingSoonPage extends StatelessWidget {
  const ComingSoonPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [

          Expanded(
            child: Center(
              child: AppText(
                "Coming soon..",
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

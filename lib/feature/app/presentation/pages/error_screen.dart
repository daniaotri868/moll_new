import 'package:flutter/material.dart';

class ErrorScreen extends StatelessWidget {
  const ErrorScreen({Key? key,  this.onRefresh}) : super(key: key);
  final VoidCallback? onRefresh;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: IconButton(
        onPressed: onRefresh,
        icon: const Icon(Icons.refresh),
      ),
    );
  }
}

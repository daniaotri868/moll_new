import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:remy/core/config/theme/my_color_scheme.dart';
import 'package:remy/core/utils/extensions/build_context.dart';

import '../../../../generated/locale_keys.g.dart';
import '../widgets/app_text.dart';

class EmptyScreen extends StatelessWidget {
  const EmptyScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AppText(LocaleKeys.Empty, style: context.textTheme.titleLarge?.copyWith(color: Colors.black)),
    );
  }
}

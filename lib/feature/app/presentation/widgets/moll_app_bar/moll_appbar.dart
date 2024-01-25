import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:remy/core/config/theme/typography.dart';
import 'package:remy/core/utils/extensions/build_context.dart';

import '../app_text.dart';

class RemyAppBar extends StatelessWidget implements PreferredSizeWidget {
  const RemyAppBar({
    Key? key,
    this.title,
    this.action,
    this.centerTitle,
    this.elevation,
    this.shadowColor,
    this.surfaceTintColor,
    this.richText = false,
    this.name,
    this.leading,
    this.bottom, this.toolbarHeight,
  }) : super(key: key);

  final String? title;
  final String? name;
  final List<Widget>? action;
  final bool? centerTitle;
  final double? elevation;
  final Color? shadowColor;
  final Color? surfaceTintColor;
  final bool? richText;
  final Widget? leading;
  final double? toolbarHeight;
final PreferredSizeWidget? bottom;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(8),
          bottomRight: Radius.circular(8),
        ),
      ),
      automaticallyImplyLeading: false,
      toolbarHeight:toolbarHeight??  101.h,
      title: richText!
          ? Padding(
              padding: const EdgeInsets.all(8.0),
              child: RichText(
                text: TextSpan(
                  text: title,
                  style: context.textTheme.bodyLarge?.xb,
                  children: <TextSpan>[
                    TextSpan(
                        text: " ${name!}",
                        style: context.textTheme.bodyLarge!.copyWith(
                            color: context.colorScheme.onPrimary,
                            fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
            )
          : AppText(title!,
              style: context.textTheme.bodyLarge!.copyWith(
                  fontWeight: FontWeight.bold,
                  color: context.colorScheme.onPrimary)),
      backgroundColor: context.colorScheme.primary,
      leading: leading,
      actions: action,
      centerTitle: centerTitle,
      elevation: elevation,
      shadowColor: shadowColor,
      surfaceTintColor: surfaceTintColor,
      bottom:bottom ,

    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

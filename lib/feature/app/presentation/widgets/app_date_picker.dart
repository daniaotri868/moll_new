// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:remy/core/config/theme/app_theme.dart';
import 'package:remy/core/config/theme/colors_app.dart';
import 'package:remy/core/config/theme/my_color_scheme.dart';
import 'package:remy/core/config/theme/typography.dart';
import 'package:remy/core/utils/extensions/build_context.dart';
import 'package:remy/core/utils/responsive_padding.dart';
import 'package:remy/feature/app/presentation/widgets/app_text.dart';

class AppDatePicker extends StatelessWidget {
  const AppDatePicker({
    Key? key,
    required this.name,
    this.title,
    this.inputFormatters,
    this.prefixIcon,
    this.icon,
    this.suffixIcon,
    this.suffix,
    this.hintText,
    this.prefix,
    this.borderWidth,
    this.borderSideColor,
    this.borderRadius,
    this.fillColor,
    this.filled,
    this.contentPadding,
    this.hintTextStyle,
  }) : super(key: key);

  final String name;
  final String? title;
  final List<TextInputFormatter>? inputFormatters;
  final Widget? prefixIcon;
  final Widget? icon;
  final Widget? suffixIcon;
  final Widget? suffix;
  final String? hintText;
  final Widget? prefix;
  final double? borderWidth;
  final Color? borderSideColor;
  final BorderRadius? borderRadius;
  final Color? fillColor;
  final bool? filled;
  final EdgeInsetsGeometry? contentPadding;
  final TextStyle? hintTextStyle;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (title != null) ...{
          AppText(
            title!.tr(),
            style: context.textTheme.titleMedium!.sb,
          ),
          13.verticalSpace,
        },
        FormBuilderDateTimePicker(
          inputType: InputType.date,
          name: name,
          inputFormatters: inputFormatters,
          decoration: InputDecoration(
            prefix: prefix,
            border: OutlineInputBorder(
              borderSide: BorderSide(
                color: borderSideColor ?? AppColors.grey.shade500,
                width: borderWidth ?? 0.5,
              ),
              borderRadius: borderRadius ?? BorderRadius.circular(kbrBorderTextField),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: borderSideColor ?? AppColors.grey.shade500,
                width: borderWidth ?? 0.5,
              ),
              borderRadius: borderRadius ?? BorderRadius.circular(kbrBorderTextField),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: borderSideColor ?? AppColors.borderTextField,
                width: borderWidth ?? 0.5,
              ),
              borderRadius: borderRadius ?? BorderRadius.circular(kbrBorderTextField),
            ),
            disabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: borderSideColor ?? AppColors.borderTextField,
                width: borderWidth ?? 0.5,
              ),
              borderRadius: borderRadius ?? BorderRadius.circular(kbrBorderTextField),
            ),
            errorBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: borderSideColor ?? context.colorScheme.error,
                width: borderWidth ?? 0.5,
              ),
              borderRadius: borderRadius ?? BorderRadius.circular(kbrBorderTextField),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: borderSideColor ?? context.colorScheme.error,
                width: borderWidth ?? 0.5,
              ),
              borderRadius: borderRadius ?? BorderRadius.circular(kbrBorderTextField),
            ),
            filled: filled ?? true,
            fillColor: fillColor ?? AppColors.fillTextField,
            contentPadding: contentPadding ?? HWEdgeInsetsDirectional.only(start: 16, end: 10),
            prefixIcon: prefixIcon,
            icon: icon,
            suffixIcon: suffixIcon,
            suffix: suffix,
            hintText: hintText,
            hintStyle: hintTextStyle ?? context.textTheme.bodyMedium.r?.withColor(context.colorScheme.grey500),
          ),
        ),
      ],
    );
  }
}

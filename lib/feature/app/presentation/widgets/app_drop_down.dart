import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:remy/core/config/theme/my_color_scheme.dart';
import 'package:remy/core/config/theme/typography.dart';
import 'package:remy/core/utils/extensions/build_context.dart';
import '../../../../core/config/theme/app_theme.dart';
import '../../../../core/config/theme/colors_app.dart';
import '../../../../core/utils/responsive_padding.dart';
import '../../../../core/utils/theme_state.dart';
import 'app_text.dart';
import 'package:collection/collection.dart';

class AppDropDownMenu<T> extends StatefulWidget {
  const AppDropDownMenu({
    this.items = const [],
    this.onChange,
    this.onSaved,
    this.onTap,
    this.validator,
    this.hint,
    this.menuMaxHeight,
    this.icon,
    this.focusNode,
    Key? key,
    this.value,
    this.title,
    this.isRate = false,
    this.isBorder=false, this.hintStyle,
  }) : super(key: key);

  final ValueChanged? onChange;
  final FormFieldSetter? onSaved;
  final FormFieldValidator? validator;
  final VoidCallback? onTap;
  final List<T> items;
  final String? hint;
  final double? menuMaxHeight;
  final Widget? icon;
  final FocusNode? focusNode;
  final T? value;
  final String? title;
  final bool isRate;
   final bool? isBorder;
   final TextStyle? hintStyle;
  @override
  State<AppDropDownMenu> createState() => _AppDropDownMenuState();
}

class _AppDropDownMenuState<T> extends ThemeState<AppDropDownMenu> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(color: Color(0x0F101828), offset: Offset(0, 1), blurRadius: 2),
          // BoxShadow(color: Color(0x1A101828), offset: Offset(0, 1), blurRadius: 3),
        ],
        borderRadius: BorderRadius.circular(10)
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (widget.title != null) ...{
            AppText(
              widget.title!,
              style: context.textTheme.titleMedium.sb,
            ),
            13.verticalSpace,
          },
          DropdownButtonFormField<T>(
            isExpanded: true,
            items:
                widget.items.mapIndexed((index, e) => DropdownMenuItem<T>(value: e, child: buildItem(index, e))).toList(),
            onChanged: widget.onChange,
            onTap: widget.onTap,
            onSaved: widget.onSaved,
            validator: widget.validator,
            menuMaxHeight: widget.menuMaxHeight,
            icon: widget.icon ?? const SizedBox.shrink(),
            focusNode: widget.focusNode,
            value: widget.value,
            dropdownColor: colorScheme.borderTextField,
            isDense: false,
            hint: widget.hint != null
                ? AppText(
                    widget.hint!,
                    style: widget.hintStyle??context.textTheme.bodyMedium?.copyWith(color: context.colorScheme.tertiary),
                  )
                : null,
            borderRadius: BorderRadius.circular(50).r,
            style: textTheme.bodyLarge?.copyWith(color: context.colorScheme.tertiary),
            decoration: InputDecoration(
              filled: true,
              fillColor:Colors.white,
              border: OutlineInputBorder(
                borderSide:(widget.isBorder)!?BorderSide.none: BorderSide(color:Colors.white, width: 0.5),
                borderRadius: BorderRadius.circular(10),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: (widget.isBorder)!?BorderSide.none: BorderSide(color: Colors.white, width: 0.5),
                borderRadius: BorderRadius.circular(10),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide:(widget.isBorder)!?BorderSide.none: BorderSide(color:  Colors.white, width: 0.5),
                borderRadius: BorderRadius.circular(10),
              ),
              disabledBorder: OutlineInputBorder(
                borderSide:(widget.isBorder)!? BorderSide.none:BorderSide(color:  Colors.white, width: 0.5),
                borderRadius: BorderRadius.circular(10),
              ),
              errorBorder: OutlineInputBorder(
                borderSide: (widget.isBorder)!? BorderSide.none:BorderSide(color:  Colors.white, width: 0.5),
                borderRadius: BorderRadius.circular(10),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderSide:(widget.isBorder)!? BorderSide.none: BorderSide(color:  Colors.white, width: 0.5),
                borderRadius: BorderRadius.circular(10),
              ),
              contentPadding: HWEdgeInsetsDirectional.only(start: 12, end: 12),
              prefixIcon: Icon(Icons.keyboard_arrow_down_rounded,
                  color: widget.items.isEmpty ? colorScheme.primary : colorScheme.primary),
            ),
          ),
        ],
      ),
    );
  }

  buildItem(int index, dynamic item) {
    final text = AppText(item is String ? item : item.name, style: textTheme.titleSmall?.r);

    if (widget.isRate) {
      return Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              text,
              Row(
                children: List.generate(
                  5 - index,
                  (index) => Icon(Icons.star_rounded, color: context.colorScheme.secondary, size: 20.r),
                ),
              )
            ],
          ),
          // 12.verticalSpace,
          // if (index != widget.items.length - 1) const Divider(height: 0),
        ],
      );
    }
    return text;
  }
}

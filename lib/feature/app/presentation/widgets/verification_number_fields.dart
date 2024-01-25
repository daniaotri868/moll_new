import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pinput/pinput.dart';
import 'package:remy/core/config/theme/my_color_scheme.dart';
import 'package:remy/core/config/theme/typography.dart';

import '../../../../core/config/theme/colors_app.dart';
import '../../../../core/utils/theme_state.dart';



class VerificationNumberFields extends StatefulWidget {
  const VerificationNumberFields({
    Key? key,
    required this.onCompleted,
    this.validator,
    required this.onChanged,
  }) : super(key: key);

  final ValueChanged<String> onCompleted;
  final ValueChanged<String> onChanged;
  final FormFieldValidator<String>? validator;

  @override
  State<VerificationNumberFields> createState() => _VerificationNumberFieldsState();
}

class _VerificationNumberFieldsState extends ThemeState<VerificationNumberFields> {
  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: 57.r,
      height: 77.r,
      textStyle: textTheme.headlineSmall?.r!.copyWith(
        color: colorScheme.onBackground,
        decoration: TextDecoration.none,
        decorationColor: colorScheme.borderTextField,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30.r),
        color: colorScheme.borderTextField,
        border: Border.all(
          color:AppColors.grey.shade200
        )
      ),
    );

    final focusedPinTheme = defaultPinTheme.copyDecorationWith(
      borderRadius: BorderRadius.circular(30.r),
    );

    final submittedPinTheme = defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration?.copyWith(),
    );

    // String pattern = r'(^(?:[+0]9)?[0-9]{10,12}$)';
    // RegExp regExp = RegExp(pattern);

    return Directionality(
      textDirection: TextDirection.ltr,
      child: Pinput(
        defaultPinTheme: defaultPinTheme,
        focusedPinTheme: focusedPinTheme,
        submittedPinTheme: submittedPinTheme,
        validator: widget.validator,
        pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
        showCursor: true,
        pinAnimationType: PinAnimationType.slide,
        onCompleted: widget.onCompleted,
        onChanged: widget.onChanged,
        length: 5,
        keyboardType: TextInputType.phone,
        inputFormatters: [
          FilteringTextInputFormatter.allow(RegExp("[0-9]"))
        ],
      ),
    );
  }
}

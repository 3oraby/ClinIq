import 'package:cliniq/core/utils/app_theme_extension.dart';
import 'package:flutter/material.dart';
import 'package:cliniq/core/utils/app_text_field_theme.dart';
import 'package:cliniq/core/utils/app_text_styles.dart';

class CustomUnderLineTextField extends StatelessWidget {
  const CustomUnderLineTextField({super.key, this.controller, this.validator});

  final TextEditingController? controller;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    final appTextFieldTheme = Theme.of(context).extension<AppTextFieldTheme>()!;

    return TextFormField(
      style: AppTextStyles.getTextStyle(
        20,
      ).copyWith(color: context.textPalette.headingColor),
      textAlign: TextAlign.center,
      controller: controller,
      validator: validator,
      decoration: InputDecoration(
        border: UnderlineInputBorder(
          borderSide: BorderSide(
            color: appTextFieldTheme.borderColor,
            width: 1,
          ),
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: appTextFieldTheme.borderColor,
            width: 1,
          ),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: appTextFieldTheme.focusedBorderColor,
            width: 2,
          ),
        ),
      ),
    );
  }
}

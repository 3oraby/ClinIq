import 'package:cliniq/core/utils/app_theme_extension.dart';
import 'package:flutter/material.dart';
import 'package:cliniq/core/utils/app_text_styles.dart';

class CustomUnderLineTextField extends StatelessWidget {
  const CustomUnderLineTextField({super.key, this.controller, this.validator});

  final TextEditingController? controller;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
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
            color: context.inputTheme.borderColor,
            width: 1,
          ),
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: context.inputTheme.borderColor,
            width: 1,
          ),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: context.inputTheme.focusedBorderColor,
            width: 2,
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:cliniq/core/helpers/get_text_palette.dart';
import 'package:cliniq/core/utils/app_text_field_theme.dart';
import 'package:cliniq/core/utils/app_text_styles.dart';

class CustomTextFormField extends StatelessWidget {
  final String? hintText;
  final String? labelText;
  final String? helperText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final bool? readOnly;
  final TextInputType? keyboardType;
  final bool obscureText;
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final VoidCallback? onSuffixTap;
  final VoidCallback? ontTap;
  final AutovalidateMode? autovalidateMode;
  final int? maxLines;
  final double contentHorizontalPadding;
  final double contentVerticalPadding;
  final FocusNode? focusNode;
  final bool removeBorders;
  final double? labelTextSize;
  final ValueChanged<String>? onChanged;
  final double borderRadius;
  final double? borderWidth;
  final Color? borderColor;
  final Color? focusedBorderColor;
  final Color? backgroundColor;
  final TextStyle? textStyle;
  final TextStyle? hintStyle;
  final TextStyle? labelStyle;
  final TextStyle? helperStyle;

  const CustomTextFormField({
    super.key,
    this.ontTap,
    this.readOnly,
    this.hintText,
    this.labelText,
    this.helperText,
    this.prefixIcon,
    this.suffixIcon,
    this.keyboardType = TextInputType.text,
    this.obscureText = false,
    this.validator,
    this.controller,
    this.onSuffixTap,
    this.autovalidateMode,
    this.maxLines = 1,
    this.contentHorizontalPadding = 16,
    this.contentVerticalPadding = 12,
    this.focusNode,
    this.removeBorders = false,
    this.labelTextSize = 16,
    this.onChanged,
    this.borderRadius = 21,
    this.borderWidth,
    this.borderColor,
    this.focusedBorderColor,
    this.backgroundColor,
    this.textStyle,
    this.hintStyle,
    this.labelStyle,
    this.helperStyle,
  });

  @override
  Widget build(BuildContext context) {
    final textPalette = getTextPalette(context);
    final appTextFieldTheme = Theme.of(context).extension<AppTextFieldTheme>()!;

    return TextFormField(
      focusNode: focusNode,
      readOnly: readOnly ?? false,
      controller: controller,
      keyboardType: keyboardType,
      obscureText: obscureText,
      validator: validator,
      onTap: ontTap,
      onTapAlwaysCalled: true,
      autovalidateMode: autovalidateMode,
      maxLines: maxLines,
      onChanged: onChanged,
      style:
          textStyle ??
          AppTextStyles.getTextStyle(
            16,
          ).copyWith(color: textPalette.headingColor),
      decoration: InputDecoration(
        filled: true,
        fillColor: backgroundColor ?? appTextFieldTheme.backgroundColor,
        hintText: hintText,
        labelText: labelText,
        helperText: helperText,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon != null
            ? GestureDetector(onTap: onSuffixTap, child: suffixIcon)
            : null,
        contentPadding: EdgeInsets.symmetric(
          vertical: contentVerticalPadding.r,
          horizontal: contentHorizontalPadding.r,
        ),
        hintStyle: hintStyle,
        labelStyle: labelStyle,
        helperStyle: helperStyle,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius.r),
          borderSide: BorderSide(
            color: borderColor ?? appTextFieldTheme.borderColor,
            width: borderWidth ?? 1,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius.r),
          borderSide: BorderSide(
            color: borderColor ?? appTextFieldTheme.borderColor,
            width: borderWidth ?? 1,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius.r),
          borderSide: BorderSide(
            color: focusedBorderColor ?? appTextFieldTheme.focusedBorderColor,
            width: borderWidth ?? 2,
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:cliniq/core/helpers/get_text_palette.dart';
import 'package:cliniq/core/utils/app_text_field_theme.dart';
import 'package:cliniq/core/utils/app_text_styles.dart';

class CustomPasswordTextField extends StatefulWidget {
  const CustomPasswordTextField({
    super.key,
    this.labelText,
    this.hintText,
    this.onChanged,
    this.onSaved,
    this.validator,
    this.controller,
    this.focusNode,
    this.autovalidateMode = AutovalidateMode.disabled,
    this.keyboardType = TextInputType.text,
    this.textStyle,
    this.hintStyle,
    this.helperStyle,
    this.labelStyle,
    this.borderRadius = 21,
    this.borderWidth,
    this.borderColor,
    this.focusedBorderColor,
    this.backgroundColor,
    this.contentHorizontalPadding = 16,
    this.contentVerticalPadding = 12,
  });

  final String? labelText;
  final String? hintText;
  final void Function(String)? onChanged;
  final void Function(String?)? onSaved;
  final FormFieldValidator<String>? validator;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final AutovalidateMode autovalidateMode;
  final TextInputType? keyboardType;
  final TextStyle? textStyle;
  final TextStyle? hintStyle;
  final TextStyle? helperStyle;
  final TextStyle? labelStyle;
  final double borderRadius;
  final double? borderWidth;
  final Color? borderColor;
  final Color? focusedBorderColor;
  final Color? backgroundColor;
  final double contentHorizontalPadding;
  final double contentVerticalPadding;

  @override
  State<CustomPasswordTextField> createState() =>
      _CustomPasswordTextFieldState();
}

class _CustomPasswordTextFieldState extends State<CustomPasswordTextField> {
  bool isObscure = true;

  @override
  Widget build(BuildContext context) {
    final appTextFieldTheme = Theme.of(context).extension<AppTextFieldTheme>()!;
    final textPalette = getTextPalette(context);

    return TextFormField(
      controller: widget.controller,
      focusNode: widget.focusNode,
      obscureText: isObscure,
      onChanged: widget.onChanged,
      onSaved: widget.onSaved,
      validator: widget.validator,
      keyboardType: widget.keyboardType,
      style:
          widget.textStyle ??
          AppTextStyles.getTextStyle(
            16,
          ).copyWith(color: textPalette.headingColor),
      decoration: InputDecoration(
        filled: true,
        fillColor: widget.backgroundColor ?? appTextFieldTheme.backgroundColor,
        labelText: widget.labelText,
        hintText: widget.hintText,
        labelStyle: widget.labelStyle,
        hintStyle: widget.hintStyle,
        helperStyle: widget.helperStyle,
        suffixIcon: IconButton(
          icon: Icon(isObscure ? Icons.visibility : Icons.visibility_off),
          onPressed: () {
            setState(() {
              isObscure = !isObscure;
            });
          },
        ),
        contentPadding: EdgeInsets.symmetric(
          vertical: widget.contentVerticalPadding.r,
          horizontal: widget.contentHorizontalPadding.r,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(widget.borderRadius.r),
          borderSide: BorderSide(
            color: widget.borderColor ?? appTextFieldTheme.borderColor,
            width: widget.borderWidth ?? 1,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(widget.borderRadius.r),
          borderSide: BorderSide(
            color: widget.borderColor ?? appTextFieldTheme.borderColor,
            width: widget.borderWidth ?? 1,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(widget.borderRadius.r),
          borderSide: BorderSide(
            color:
                widget.focusedBorderColor ??
                appTextFieldTheme.focusedBorderColor,
            width: widget.borderWidth ?? 2,
          ),
        ),
      ),
    );
  }
}

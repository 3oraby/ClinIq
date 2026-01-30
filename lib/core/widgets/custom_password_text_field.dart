import 'package:cliniq/core/utils/app_theme_extension.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
    this.borderRadius = 9,
    this.borderWidth,
    this.borderColor,
    this.focusedBorderColor,
    this.backgroundColor,
    this.contentHorizontalPadding = 16,
    this.contentVerticalPadding = 12,
    this.focusedBorderWidth = 2,
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
  final double focusedBorderWidth;

  @override
  State<CustomPasswordTextField> createState() =>
      _CustomPasswordTextFieldState();
}

class _CustomPasswordTextFieldState extends State<CustomPasswordTextField> {
  bool isObscure = true;

  InputBorder _buildBorder(Color color, double width) {
    if (width == 0) {
      return InputBorder.none;
    }

    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(widget.borderRadius.r),
      borderSide: BorderSide(color: color, width: width),
    );
  }

  @override
  Widget build(BuildContext context) {
    final inputTheme = context.inputTheme;

    return ClipRRect(
      borderRadius: BorderRadius.circular(widget.borderRadius.r),
      child: TextFormField(
        controller: widget.controller,
        focusNode: widget.focusNode,
        obscureText: isObscure,
        onChanged: widget.onChanged,
        onSaved: widget.onSaved,
        validator: widget.validator,
        keyboardType: widget.keyboardType,
        autovalidateMode: widget.autovalidateMode,
        style:
            widget.textStyle ??
            AppTextStyles.getTextStyle(
              14,
            ).copyWith(color: inputTheme.textColor),
        decoration: InputDecoration(
          filled: true,
          fillColor: widget.backgroundColor ?? inputTheme.backgroundColor,

          labelText: widget.labelText?.tr(),
          hintText: widget.hintText?.tr(),
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

          border: _buildBorder(
            widget.borderColor ?? inputTheme.borderColor,
            widget.borderWidth ?? 0,
          ),
          enabledBorder: _buildBorder(
            widget.borderColor ?? inputTheme.borderColor,
            widget.borderWidth ?? 0,
          ),
          focusedBorder: _buildBorder(
            widget.focusedBorderColor ?? inputTheme.focusedBorderColor,
            widget.focusedBorderWidth,
          ),
          errorBorder: _buildBorder(
            widget.borderColor ?? inputTheme.borderColor,
            widget.borderWidth ?? 1,
          ),
          disabledBorder: _buildBorder(
            widget.borderColor ?? inputTheme.borderColor,
            widget.borderWidth ?? 0,
          ),
        ),
      ),
    );
  }
}

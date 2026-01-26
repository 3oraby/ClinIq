import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:cliniq/core/helpers/get_text_palette.dart';
import 'package:cliniq/core/utils/app_text_styles.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    this.onPressed,
    this.text,
    this.backgroundColor,
    this.textColor,
    this.height = 48,
    this.width,
    this.borderRadius = 21,
    this.borderWidth = 1,
    this.textFontSize = 16,
    this.isOutline = false,
    this.isDisabled = false,
    this.borderColor,
    this.child,
  });

  final String? text;
  final VoidCallback? onPressed;
  final Color? backgroundColor;
  final Color? textColor;
  final double height;
  final double? width;
  final double borderRadius;
  final double borderWidth;
  final double textFontSize;
  final bool isOutline;
  final bool isDisabled;
  final Color? borderColor;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    final textPalette = getTextPalette(context);

    return InkWell(
      onTap: isDisabled ? null : onPressed,
      child: Container(
        height: height.h,
        width: width?.w ?? double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(borderRadius.r),
          color: isDisabled
              ? Theme.of(context).disabledColor
              : backgroundColor ?? Theme.of(context).primaryColor,
          border: Border.all(
            color: isOutline
                ? borderColor ?? Theme.of(context).primaryColor
                : Colors.transparent,
            width: borderWidth.r,
          ),
        ),
        child:
            child ??
            Center(
              child: Text(
                text ?? '',
                style: AppTextStyles.getTextStyle(textFontSize).copyWith(
                  color: textColor ?? textPalette.contentBackgroundColor,
                ),
              ),
            ),
      ),
    );
  }
}

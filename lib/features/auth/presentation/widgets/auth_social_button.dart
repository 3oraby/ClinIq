import 'package:cliniq/core/utils/app_theme_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:cliniq/core/utils/app_text_styles.dart';
import 'package:cliniq/core/widgets/custom_button.dart';
import 'package:cliniq/core/widgets/horizontal_gap.dart';

class AuthSocialButton extends StatelessWidget {
  const AuthSocialButton({
    super.key,
    required this.description,
    required this.image,
    this.onPressed,
  });
  final String description;
  final String image;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return CustomButton(
      backgroundColor: context.inputTheme.backgroundColor,
      onPressed: onPressed,
      isOutline: true,
      borderRadius: 21,
      borderColor: context.theme.dividerColor,
      borderWidth: 0.6,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(image, height: 16.h, width: 24.w),
          const HorizontalGap(12),
          Text(
            description,
            style: AppTextStyles.getTextStyle(11).copyWith(
              color: context.textPalette.labelColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}

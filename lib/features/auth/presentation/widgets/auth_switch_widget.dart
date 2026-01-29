import 'package:cliniq/core/utils/app_theme_extension.dart';
import 'package:flutter/material.dart';
import 'package:cliniq/core/utils/app_text_styles.dart';

class AuthSwitchWidget extends StatelessWidget {
  const AuthSwitchWidget({
    super.key,
    required this.title,
    required this.buttonDescription,
    this.onButtonPressed,
  });
  final String title;
  final String buttonDescription;
  final VoidCallback? onButtonPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          title,
          style: AppTextStyles.getTextStyle(14).copyWith(
            color: context.textPalette.secondaryColor.withValues(alpha: 0.5),
          ),
        ),
        TextButton(
          onPressed: onButtonPressed,
          child: Text(
            buttonDescription,
            style: AppTextStyles.getTextStyle(
              14,
            ).copyWith(color: Theme.of(context).primaryColor),
          ),
        ),
      ],
    );
  }
}

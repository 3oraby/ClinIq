import 'package:flutter/material.dart';
import 'package:cliniq/core/utils/app_theme_extension.dart';
import 'package:cliniq/core/utils/app_text_styles.dart';

class SettingsActionTile extends StatelessWidget {
  final String title;
  final IconData icon;
  final VoidCallback onTap;
  final Color? textColor;
  final Color? iconColor;
  final Widget? trailing;

  const SettingsActionTile({
    super.key,
    required this.title,
    required this.icon,
    required this.onTap,
    this.textColor,
    this.iconColor,
    this.trailing,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          contentPadding: EdgeInsets.zero,
          leading: Icon(
            icon,
            color: iconColor ?? context.colorScheme.secondary,
          ),
          title: Text(
            title,
            style: AppTextStyles.getTextStyle(16).copyWith(
              fontWeight: FontWeight.w500,
              color: textColor ?? context.textPalette.primaryColor,
            ),
          ),
          trailing:
              trailing ??
              const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
          onTap: onTap,
        ),
      ],
    );
  }
}

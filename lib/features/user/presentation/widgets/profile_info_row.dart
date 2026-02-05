import 'package:cliniq/core/utils/app_text_styles.dart';
import 'package:cliniq/core/utils/app_theme_extension.dart';
import 'package:cliniq/core/widgets/horizontal_gap.dart';
import 'package:cliniq/core/widgets/vertical_gap.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class ProfileInfoRow extends StatelessWidget {
  const ProfileInfoRow({
    super.key,
    required this.title,
    required this.value,
    required this.icon,
    this.iconColor,
  });

  final String title;
  final String value;
  final IconData icon;
  final Color? iconColor;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.onPrimaryContainer,
            shape: BoxShape.circle,
            border: Border.all(
              color:
                  iconColor ??
                  context.theme.primaryColor.withValues(alpha: 0.3),
              width: 2,
            ),
          ),
          child: Icon(
            icon,
            color: iconColor ?? context.theme.primaryColor,
            size: 20,
          ),
        ),
        const HorizontalGap(15),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title.tr(),
                style: AppTextStyles.getTextStyle(13).copyWith(
                  color: context.textPalette.primaryColor,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const VerticalGap(4),
              Text(
                value,
                style: AppTextStyles.getTextStyle(16).copyWith(
                  color: context.textPalette.primaryColor,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

import 'package:cliniq/core/utils/app_text_styles.dart';
import 'package:cliniq/core/utils/app_theme_extension.dart';
import 'package:cliniq/core/widgets/horizontal_gap.dart';
import 'package:cliniq/core/widgets/user_profile_image.dart';
import 'package:cliniq/core/widgets/vertical_gap.dart';
import 'package:flutter/material.dart';

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({super.key, required this.name, required this.email});

  final String name;
  final String email;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        UserProfileImage(circleAvatarRadius: 65, isEnabled: false),
        const VerticalGap(20),
        Text(
          name,
          style: AppTextStyles.getTextStyle(24).copyWith(
            fontWeight: FontWeight.bold,
            color: context.textPalette.primaryColor,
          ),
        ),
        const VerticalGap(5),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.email_outlined,
              size: 16,
              color: context.textPalette.primaryColor,
            ),
            const HorizontalGap(8),
            Text(
              email,
              style: AppTextStyles.getTextStyle(
                14,
              ).copyWith(color: context.textPalette.primaryColor),
            ),
          ],
        ),
      ],
    );
  }
}

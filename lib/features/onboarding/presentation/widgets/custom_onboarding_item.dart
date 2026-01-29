import 'package:cliniq/core/utils/app_fonts.dart';
import 'package:cliniq/core/utils/app_theme_extension.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:cliniq/core/utils/app_text_styles.dart';
import 'package:cliniq/core/widgets/vertical_gap.dart';

class CustomOnboardingItem extends StatelessWidget {
  final String image;
  final String title;
  final String description;

  const CustomOnboardingItem({
    super.key,
    required this.image,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(image),
        const VerticalGap(26),
        RPadding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title.tr(),
                style: AppTextStyles.getTextStyle(24).copyWith(
                  fontFamily: AppFonts.cairo,
                  fontWeight: FontWeight.w900,
                  color: context.textPalette.primaryColor,
                ),
              ),
              const VerticalGap(8),
              Text(
                description.tr(),
                style: AppTextStyles.getTextStyle(16).copyWith(
                  fontFamily: AppFonts.cairo,
                  fontWeight: FontWeight.w500,
                  color: context.textPalette.secondaryColor,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

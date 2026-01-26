import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:cliniq/core/helpers/get_text_palette.dart';
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
    final textPalette = getTextPalette(context);

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(image, height: 334.h, width: 300.w),
        Text(
          title.tr(),
          textAlign: TextAlign.center,
          style: AppTextStyles.getTextStyle(22).copyWith(
            fontWeight: FontWeight.w700,
            color: textPalette.headingColor,
          ),
        ),
        const VerticalGap(4),
        Text(
          description.tr(),
          textAlign: TextAlign.center,
          style: AppTextStyles.getTextStyle(
            14,
          ).copyWith(color: textPalette.primaryColor),
        ),
      ],
    );
  }
}

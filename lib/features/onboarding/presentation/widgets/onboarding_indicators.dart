import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:cliniq/core/utils/app_dark_colors.dart';
import 'package:cliniq/core/utils/app_light_colors.dart';
import 'package:cliniq/features/onboarding/data/sources/onboarding_local_data_source.dart';

class OnboardingIndicators extends StatelessWidget {
  const OnboardingIndicators({super.key, required this.currentIndex});

  final int currentIndex;

  @override
  Widget build(BuildContext context) {
    return DotsIndicator(
      dotsCount: onboardingList.length,
      animate: true,
      position: currentIndex.toDouble(),
      animationDuration: const Duration(milliseconds: 300),
      decorator: DotsDecorator(
        size: Size.square(11.w),
        activeSize: Size(19.w, 11.h),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(250.r),
        ),
        activeColor: Theme.of(context).brightness == Brightness.light
            ? AppLightColors.primaryColor
            : AppDarkColors.primaryColor,
        color: Theme.of(context).brightness == Brightness.light
            ? const Color(0xFFF5F5F5)
            : AppDarkColors.scaffoldBackgroundColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(60.r),
          side: BorderSide(color: AppDarkColors.primaryColor, width: 2.r),
        ),
      ),
    );
  }
}

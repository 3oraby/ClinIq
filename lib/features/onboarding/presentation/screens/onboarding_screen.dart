import 'dart:math';

import 'package:cliniq/core/utils/app_theme_extension.dart';
import 'package:cliniq/features/onboarding/presentation/widgets/onboarding_progress_painter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:cliniq/core/utils/app_routes.dart';
import 'package:cliniq/core/widgets/vertical_gap.dart';
import 'package:cliniq/features/onboarding/data/sources/onboarding_local_data_source.dart';
import 'package:cliniq/features/onboarding/presentation/widgets/custom_onboarding_item.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController pageController = PageController();
  int currentIndex = 0;

  onNextButtonPressed() {
    if (currentIndex < onboardingList.length - 1) {
      pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      Navigator.pushNamedAndRemoveUntil(
        context,
        Routes.initialAuthScreen,
        (route) => false,
      );
    }
  }

  double getSweepAngle() {
    switch (currentIndex) {
      case 0:
        return 0;
      case 1:
        return 210 * pi / 180;
      case 2:
        return 330 * pi / 180;
      default:
        return 0;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: pageController,
              itemCount: onboardingList.length,
              onPageChanged: (index) {
                setState(() => currentIndex = index);
              },
              itemBuilder: (context, index) {
                final item = onboardingList[index];
                return CustomOnboardingItem(
                  image: item.image,
                  title: item.title,
                  description: item.description,
                );
              },
            ),
          ),

          const VerticalGap(20),
          GestureDetector(
            onTap: onNextButtonPressed,
            child: Stack(
              alignment: Alignment.center,
              children: [
                SizedBox(
                  width: 76.w,
                  height: 76.w,
                  child: CustomPaint(
                    painter: OnboardingProgressPainter(
                      sweepAngle: getSweepAngle(),
                      color: Theme.of(context).primaryColor,
                      strokeWidth: 5,
                    ),
                  ),
                ),

                Container(
                  width: 56.w,
                  height: 56.w,
                  decoration: BoxDecoration(
                    color: context.theme.primaryColor,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.arrow_forward,
                    color: context.colorScheme.onPrimary,
                  ),
                ),
              ],
            ),
          ),

          const VerticalGap(20),
        ],
      ),
    );
  }
}

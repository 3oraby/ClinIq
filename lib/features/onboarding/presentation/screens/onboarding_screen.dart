import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:cliniq/core/utils/app_dark_colors.dart';
import 'package:cliniq/core/utils/app_routes.dart';
import 'package:cliniq/core/utils/app_svgs.dart';
import 'package:cliniq/core/widgets/vertical_gap.dart';
import 'package:cliniq/features/onboarding/data/sources/onboarding_local_data_source.dart';
import 'package:cliniq/features/onboarding/presentation/widgets/custom_onboarding_item.dart';
import 'package:cliniq/features/onboarding/presentation/widgets/onboarding_indicators.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).brightness == Brightness.light
          ? const Color(0xFFF5F5F5)
          : AppDarkColors.scaffoldBackgroundColor,
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

          OnboardingIndicators(currentIndex: currentIndex),

          const VerticalGap(20),

          GestureDetector(
            onTap: onNextButtonPressed,
            child: SvgPicture.asset(AppSvgs.onboardingButton),
          ),
          const VerticalGap(20),
        ],
      ),
    );
  }
}

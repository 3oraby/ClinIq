import 'dart:math';

import 'package:cliniq/core/constants/locale_keys.dart';
import 'package:cliniq/core/constants/storage_keys.dart';
import 'package:cliniq/core/helpers/app_storage_helper.dart';
import 'package:cliniq/core/utils/app_routes.dart';
import 'package:cliniq/core/utils/app_theme_extension.dart';
import 'package:cliniq/core/widgets/vertical_gap.dart';
import 'package:cliniq/features/onboarding/data/sources/onboarding_local_data_source.dart';
import 'package:cliniq/features/onboarding/presentation/widgets/custom_onboarding_item.dart';
import 'package:cliniq/features/onboarding/presentation/widgets/onboarding_progress_painter.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen>
    with SingleTickerProviderStateMixin {
  final PageController pageController = PageController();
  int currentIndex = 0;

  late AnimationController _animationController;
  late Animation<double> _sweepAnimation;
  double _previousSweepAngle = 0;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    );

    _sweepAnimation = Tween<double>(begin: 0, end: 0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeOutBack),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    pageController.dispose();
    super.dispose();
  }

  void animateSweep(double newSweepAngle) {
    _sweepAnimation =
        Tween<double>(begin: _previousSweepAngle, end: newSweepAngle).animate(
          CurvedAnimation(
            parent: _animationController,
            curve: Curves.easeOutBack,
          ),
        );

    _animationController
      ..reset()
      ..forward();

    _previousSweepAngle = newSweepAngle;
  }

  void onNextButtonPressed() async {
    if (currentIndex < onboardingList.length - 1) {
      pageController.nextPage(
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOutCubic,
      );
    } else {
      await AppStorageHelper.setBool(StorageKeys.isOnboardingCompleted, true);
      navigateToLoginScreen();
    }
  }

  void onSkipPressed() async {
    await AppStorageHelper.setBool(StorageKeys.isOnboardingCompleted, true);
    navigateToLoginScreen();
  }

  void navigateToLoginScreen() {
    Navigator.pushNamedAndRemoveUntil(
      context,
      Routes.loginScreen,
      (route) => false,
    );
  }

  double getSweepAngle(int index) {
    if (index == 0) return 30 * pi / 180;
    final total = onboardingList.length;
    return (index + 1) / total * 2 * pi;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.scaffoldBackgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            _OnboardingHeader(
              onSkip: onSkipPressed,
              showSkip: currentIndex < onboardingList.length - 1,
            ).animate().fadeIn(duration: 400.ms).slideY(begin: -0.2),
            Expanded(
              child: PageView.builder(
                controller: pageController,
                physics: const BouncingScrollPhysics(),
                itemCount: onboardingList.length,
                onPageChanged: (index) {
                  animateSweep(getSweepAngle(index));
                  setState(() => currentIndex = index);
                },
                itemBuilder: (context, index) {
                  final item = onboardingList[index];
                  return CustomOnboardingItem(item: item, index: index);
                },
              ),
            ),
            const VerticalGap(20),
            _OnboardingNavigation(
                  currentIndex: currentIndex,
                  totalSteps: onboardingList.length,
                  sweepAnimation: _sweepAnimation,
                  onNext: onNextButtonPressed,
                )
                .animate()
                .fadeIn(delay: 400.ms)
                .scale(begin: const Offset(0.8, 0.8)),
            const VerticalGap(32),
          ],
        ),
      ),
    );
  }
}

class _OnboardingHeader extends StatelessWidget {
  final VoidCallback onSkip;
  final bool showSkip;

  const _OnboardingHeader({required this.onSkip, required this.showSkip});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Hero(
            tag: 'app_logo',
            child: Icon(
              Icons.health_and_safety_rounded,
              color: context.colorScheme.primary,
              size: 32.sp,
            ),
          ),
          if (showSkip)
            TextButton(
              onPressed: onSkip,
              style: TextButton.styleFrom(
                foregroundColor: context.textPalette.secondaryColor,
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.r),
                ),
              ),
              child: Text(
                LocaleKeys.onboardingSkip.tr(),
                style: context.theme.textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.w700,
                  color: context.colorScheme.primary,
                ),
              ),
            ),
        ],
      ),
    );
  }
}

class _OnboardingNavigation extends StatelessWidget {
  final int currentIndex;
  final int totalSteps;
  final Animation<double> sweepAnimation;
  final VoidCallback onNext;

  const _OnboardingNavigation({
    required this.currentIndex,
    required this.totalSteps,
    required this.sweepAnimation,
    required this.onNext,
  });

  @override
  Widget build(BuildContext context) {
    final isLast = currentIndex == totalSteps - 1;
    final isRtl = context.locale.languageCode == 'ar';

    return GestureDetector(
      onTap: onNext,
      child: Stack(
        alignment: Alignment.center,
        children: [
          AnimatedOpacity(
            duration: 300.ms,
            opacity: isLast ? 0.0 : 1.0,
            child: SizedBox(
              width: 84.w,
              height: 84.w,
              child: AnimatedBuilder(
                animation: sweepAnimation,
                builder: (context, child) {
                  return CustomPaint(
                    painter: OnboardingProgressPainter(
                      sweepAngle: sweepAnimation.value,
                      color: context.colorScheme.primary,
                      strokeWidth: 4,
                    ),
                  );
                },
              ),
            ),
          ),
          AnimatedContainer(
            duration: 400.ms,
            width: isLast ? 140.w : 64.w,
            height: 64.w,
            decoration: BoxDecoration(
              color: context.colorScheme.primary,
              borderRadius: BorderRadius.circular(isLast ? 20.r : 32.r),
              boxShadow: [
                BoxShadow(
                  color: context.colorScheme.primary.withValues(alpha: 0.3),
                  blurRadius: 15,
                  offset: const Offset(0, 6),
                ),
              ],
            ),
            child: Center(
              child: AnimatedSwitcher(
                duration: 300.ms,
                transitionBuilder: (child, animation) {
                  return FadeTransition(opacity: animation, child: child);
                },
                child: isLast
                    ? Text(
                        LocaleKeys.onboardingGetStarted.tr(),
                        key: const ValueKey('get_started'),
                        style: context.theme.textTheme.titleMedium?.copyWith(
                          color: context.colorScheme.onPrimary,
                          fontWeight: FontWeight.w800,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      )
                    : Transform.flip(
                        flipX: isRtl,
                        child: Icon(
                          Icons.arrow_forward_ios_rounded,
                          key: const ValueKey('next'),
                          color: context.colorScheme.onPrimary,
                          size: 24.sp,
                        ),
                      ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

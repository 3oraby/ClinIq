import 'package:cliniq/core/utils/app_theme_extension.dart';
import 'package:cliniq/core/widgets/custom_card_section.dart';
import 'package:cliniq/core/widgets/vertical_gap.dart';
import 'package:cliniq/features/onboarding/domain/entities/onboarding_entity.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:cliniq/core/utils/app_text_styles.dart';

class CustomOnboardingItem extends StatelessWidget {
  final OnboardingEntity item;
  final int index;

  const CustomOnboardingItem({
    super.key,
    required this.item,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const VerticalGap(20),
        Expanded(
          flex: 5,
          child: Image.asset(item.image, fit: BoxFit.contain)
              .animate(key: ValueKey(item.image))
              .fadeIn(duration: 600.ms)
              .scale(begin: const Offset(0.8, 0.8), curve: Curves.easeOutBack),
        ),
        const VerticalGap(40),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child:
              CustomCardSection(
                    children: [
                      Text(
                        item.title.tr(),
                        style: AppTextStyles.getTextStyle(24).copyWith(
                          fontWeight: FontWeight.w900,
                          color: context.colorScheme.primary,
                          letterSpacing: -0.5,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const VerticalGap(12),
                      Text(
                        item.description.tr(),
                        style: AppTextStyles.getTextStyle(16).copyWith(
                          fontWeight: FontWeight.w500,
                          color: context.textPalette.secondaryColor,
                          height: 1.5,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  )
                  .animate(key: ValueKey('card_$index'))
                  .fadeIn(delay: 200.ms)
                  .slideY(begin: 0.2, curve: Curves.easeOutQuad),
        ),
        const VerticalGap(40),
      ],
    );
  }
}

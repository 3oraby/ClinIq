import 'package:cliniq/core/constants/locale_keys.dart';
import 'package:cliniq/core/utils/app_text_styles.dart';
import 'package:cliniq/core/utils/app_theme_extension.dart';
import 'package:cliniq/core/widgets/custom_card_section.dart';
import 'package:cliniq/core/widgets/vertical_gap.dart';
import 'package:cliniq/features/appointments/domain/entities/doctor_schedule_entity.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WorkingHoursSection extends StatelessWidget {
  final List<WorkingDayRangeEntity> weeklySchedule;

  const WorkingHoursSection({super.key, required this.weeklySchedule});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(
              Icons.access_time_rounded,
              color: context.colorScheme.primary,
              size: 20.sp,
            ),
            const SizedBox(width: 8),
            Text(
              LocaleKeys.bookingWorkingHours.tr(),
              style: AppTextStyles.getTextStyle(18).copyWith(
                fontWeight: FontWeight.w800,
                color: context.textPalette.primaryColor,
              ),
            ),
          ],
        ).animate().fadeIn(delay: 700.ms),
        const VerticalGap(16),
        CustomCardSection(
          children: weeklySchedule.map((item) {
            final isLast = item == weeklySchedule.last;
            return Padding(
              padding: EdgeInsets.only(bottom: isLast ? 0 : 12.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    item.day,
                    style: AppTextStyles.getTextStyle(14).copyWith(
                      color: context.textPalette.primaryColor,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    item.range,
                    style: AppTextStyles.getTextStyle(14).copyWith(
                      color: context.textPalette.secondaryColor,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            );
          }).toList(),
        ).animate().fadeIn(delay: 800.ms).slideY(begin: 0.1),
      ],
    );
  }
}

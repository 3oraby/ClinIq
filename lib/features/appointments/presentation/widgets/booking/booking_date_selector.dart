import 'package:cliniq/core/constants/locale_keys.dart';
import 'package:cliniq/core/utils/app_text_styles.dart';
import 'package:cliniq/core/utils/app_theme_extension.dart';
import 'package:cliniq/core/widgets/vertical_gap.dart';
import 'package:cliniq/features/appointments/domain/entities/doctor_schedule_entity.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BookingDateSelector extends StatelessWidget {
  final List<DoctorDateAvailabilityEntity> dates;
  final String? selectedFullDate;
  final ValueChanged<String> onDateSelected;

  const BookingDateSelector({
    super.key,
    required this.dates,
    required this.selectedFullDate,
    required this.onDateSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(
              Icons.calendar_month_rounded,
              color: context.colorScheme.primary,
              size: 20.sp,
            ),
            const SizedBox(width: 8),
            Text(
              LocaleKeys.bookingTitle.tr(),
              style: AppTextStyles.getTextStyle(18).copyWith(
                fontWeight: FontWeight.w800,
                color: context.textPalette.primaryColor,
              ),
            ),
          ],
        ).animate().fadeIn(delay: 900.ms),
        const VerticalGap(16),
        SizedBox(
          height: 125.h,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            itemCount: dates.length,
            separatorBuilder: (context, index) => SizedBox(width: 16.w),
            itemBuilder: (context, index) {
              final dateItem = dates[index];
              final isSelected = selectedFullDate == dateItem.fullDate;
              final primaryColor = context.colorScheme.primary;

              return GestureDetector(
                    onTap: () {
                      if (!dateItem.isFull) {
                        onDateSelected(dateItem.fullDate);
                      }
                    },
                    child: Container(
                      width: 110.w,
                      decoration: BoxDecoration(
                        color: isSelected
                            ? primaryColor.withValues(alpha: 0.05)
                            : context.colorScheme.surface,
                        borderRadius: BorderRadius.circular(24.r),
                        border: Border.all(
                          color: isSelected
                              ? primaryColor
                              : context.colorScheme.outline.withValues(
                                  alpha: 0.1,
                                ),
                          width: isSelected ? 2 : 1,
                        ),
                        boxShadow: isSelected
                            ? [
                                BoxShadow(
                                  color: primaryColor.withValues(alpha: 0.1),
                                  blurRadius: 12,
                                  offset: const Offset(0, 4),
                                ),
                              ]
                            : null,
                      ),
                      child: Column(
                        children: [
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  dateItem.day,
                                  style: AppTextStyles.getTextStyle(13)
                                      .copyWith(
                                        color: isSelected
                                            ? primaryColor
                                            : context
                                                  .textPalette
                                                  .secondaryColor,
                                        fontWeight: isSelected
                                            ? FontWeight.w700
                                            : FontWeight.w500,
                                      ),
                                ),
                                const VerticalGap(4),
                                Text(
                                  dateItem.date,
                                  style: AppTextStyles.getTextStyle(20)
                                      .copyWith(
                                        fontWeight: FontWeight.w900,
                                        color: isSelected
                                            ? primaryColor
                                            : context.textPalette.primaryColor,
                                      ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            width: double.infinity,
                            padding: EdgeInsets.symmetric(vertical: 8.h),
                            decoration: BoxDecoration(
                              color: dateItem.isFull
                                  ? context.colorScheme.error
                                  : isSelected
                                  ? primaryColor
                                  : primaryColor.withValues(alpha: 0.1),
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(22.r),
                                bottomRight: Radius.circular(22.r),
                              ),
                            ),
                            alignment: Alignment.center,
                            child: Text(
                              dateItem.isFull
                                  ? LocaleKeys.bookingFull.tr()
                                  : "${LocaleKeys.bookingPatient.tr()} ${dateItem.patientCount}",
                              style: AppTextStyles.getTextStyle(11).copyWith(
                                color: dateItem.isFull || isSelected
                                    ? Colors.white
                                    : primaryColor,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                  .animate()
                  .fadeIn(delay: (950 + (index * 50)).ms)
                  .scale(begin: const Offset(0.9, 0.9));
            },
          ),
        ),
      ],
    );
  }
}

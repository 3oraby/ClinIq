import 'package:cliniq/core/constants/locale_keys.dart';
import 'package:cliniq/core/utils/app_text_styles.dart';
import 'package:cliniq/core/utils/app_theme_extension.dart';
import 'package:cliniq/features/appointments/domain/entities/doctor_schedule_entity.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
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
    return SizedBox(
      height: 120.h,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
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
              width: 100.w,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20.r),
                border: isSelected
                    ? Border.all(color: primaryColor, width: 2)
                    : Border.all(
                        color: context.theme.dividerColor.withValues(
                          alpha: 0.1,
                        ),
                      ),
              ),
              child: Column(
                children: [
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          dateItem.day,
                          style: AppTextStyles.getTextStyle(
                            14,
                          ).copyWith(color: context.textPalette.secondaryColor),
                        ),
                        Text(
                          dateItem.date,
                          style: AppTextStyles.getTextStyle(
                            18,
                          ).copyWith(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(vertical: 8.h),
                    decoration: BoxDecoration(
                      color: dateItem.isFull ? Colors.red : primaryColor,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(18.r),
                        bottomRight: Radius.circular(18.r),
                      ),
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      dateItem.isFull
                          ? LocaleKeys.bookingFull.tr()
                          : "${LocaleKeys.bookingPatient.tr()} ${dateItem.patientCount}",
                      style: AppTextStyles.getTextStyle(12).copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

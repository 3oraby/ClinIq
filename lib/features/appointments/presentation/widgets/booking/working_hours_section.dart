import 'package:cliniq/core/constants/locale_keys.dart';
import 'package:cliniq/core/utils/app_text_styles.dart';
import 'package:cliniq/core/utils/app_theme_extension.dart';
import 'package:cliniq/core/widgets/vertical_gap.dart';
import 'package:cliniq/features/appointments/domain/entities/doctor_schedule_entity.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WorkingHoursSection extends StatelessWidget {
  final List<WorkingDayRangeEntity> weeklySchedule;

  const WorkingHoursSection({super.key, required this.weeklySchedule});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          LocaleKeys.bookingWorkingHours.tr(),
          style: AppTextStyles.getTextStyle(
            18,
          ).copyWith(fontWeight: FontWeight.bold),
        ),
        const VerticalGap(12),
        ...weeklySchedule.map(
          (item) => Padding(
            padding: EdgeInsets.only(bottom: 8.h),
            child: Text(
              "${item.day} ( ${item.range} )",
              style: AppTextStyles.getTextStyle(14).copyWith(
                color: context.textPalette.secondaryColor,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

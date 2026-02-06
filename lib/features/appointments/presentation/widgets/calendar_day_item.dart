import 'package:cliniq/core/utils/app_text_styles.dart';
import 'package:cliniq/core/utils/app_theme_extension.dart';
import 'package:cliniq/core/widgets/vertical_gap.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

class CalendarDayItem extends StatelessWidget {
  final DateTime day;
  final bool isSelected;
  final VoidCallback onTap;

  const CalendarDayItem({
    super.key,
    required this.day,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final primaryColor = context.colorScheme.primary;
    final surfaceColor = context.colorScheme.surface;

    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        width: 62.w,
        height: 100.h,
        decoration: BoxDecoration(
          color: isSelected ? primaryColor : surfaceColor,
          borderRadius: BorderRadius.circular(30.r),
          border: isSelected
              ? null
              : Border.all(
                  color: context.colorScheme.outline.withValues(alpha: 0.1),
                ),
          boxShadow: [
            BoxShadow(
              color: isSelected
                  ? primaryColor.withValues(alpha: 0.25)
                  : Colors.black.withValues(alpha: 0.04),
              blurRadius: 15,
              offset: const Offset(0, 8),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              DateFormat('E').format(day),
              style: AppTextStyles.getTextStyle(12).copyWith(
                color: isSelected
                    ? context.colorScheme.onPrimary
                    : context.textPalette.secondaryColor,
                fontWeight: isSelected ? FontWeight.w800 : FontWeight.w500,
              ),
            ),
            const VerticalGap(10),
            Container(
              width: 32.w,
              height: 32.w,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: isSelected
                    ? context.colorScheme.onPrimary
                    : context.colorScheme.primary.withValues(alpha: 0.05),
              ),
              alignment: Alignment.center,
              child: Text(
                day.day.toString(),
                style: AppTextStyles.getTextStyle(14).copyWith(
                  color: isSelected
                      ? primaryColor
                      : context.textPalette.primaryColor,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

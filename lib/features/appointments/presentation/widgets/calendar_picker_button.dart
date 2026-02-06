import 'package:cliniq/core/utils/app_theme_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CalendarPickerButton extends StatelessWidget {
  final VoidCallback onTap;

  const CalendarPickerButton({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 50.w,
        height: 100.h,
        decoration: BoxDecoration(
          color: context.colorScheme.primary.withValues(alpha: 0.05),
          borderRadius: BorderRadius.circular(30.r),
          border: Border.all(
            color: context.colorScheme.primary.withValues(alpha: 0.1),
          ),
        ),
        child: Icon(
          Icons.calendar_month_rounded,
          color: context.colorScheme.primary,
          size: 24.sp,
        ),
      ),
    );
  }
}

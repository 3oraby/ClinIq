import 'package:cliniq/core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

class CalendarTimeline extends StatefulWidget {
  final Function(DateTime) onDateSelected;
  const CalendarTimeline({super.key, required this.onDateSelected});

  @override
  State<CalendarTimeline> createState() => _CalendarTimelineState();
}

class _CalendarTimelineState extends State<CalendarTimeline> {
  DateTime selectedDate = DateTime.now();
  late List<DateTime> days;
  DateTime startOfWeek = DateTime.now();

  @override
  void initState() {
    super.initState();
    _generateDays();
  }

  void _generateDays() {
    // Generate 4 dates starting from startOfWeek
    days = List.generate(4, (index) => startOfWeek.add(Duration(days: index)));
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: Theme.of(context).colorScheme.copyWith(
              primary: Theme.of(context).colorScheme.primary,
              onPrimary: Colors.white,
              onSurface: Colors.black,
            ),
          ),
          child: child!,
        );
      },
    );
    if (picked != null) {
      setState(() {
        selectedDate = picked;
        startOfWeek = picked; // Update start to the picked date
        _generateDays();
      });
      widget.onDateSelected(picked);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // The 4 dynamic dates
          ...days.map((day) {
            final isSelected = DateUtils.isSameDay(day, selectedDate);
            return GestureDetector(
              onTap: () {
                setState(() {
                  selectedDate = day;
                });
                widget.onDateSelected(day);
              },
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                width: 62.w,
                height: 95.h,
                decoration: BoxDecoration(
                  color: isSelected
                      ? Theme.of(context).colorScheme.primary
                      : Theme.of(context).colorScheme.surface,
                  borderRadius: BorderRadius.circular(35.r),
                  border: isSelected
                      ? null
                      : Border.all(
                          color: Theme.of(
                            context,
                          ).dividerColor.withValues(alpha: 0.05),
                        ),
                  boxShadow: [
                    BoxShadow(
                      color: isSelected
                          ? Theme.of(
                              context,
                            ).colorScheme.primary.withValues(alpha: 0.25)
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
                        color: isSelected ? Colors.white : Colors.grey,
                        fontWeight: isSelected
                            ? FontWeight.w600
                            : FontWeight.w400,
                      ),
                    ),
                    SizedBox(height: 8.h),
                    Container(
                      width: 32.w,
                      height: 32.w,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: isSelected ? Colors.white : Colors.transparent,
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        day.day.toString(),
                        style: AppTextStyles.getTextStyle(14).copyWith(
                          color: isSelected
                              ? Theme.of(context).colorScheme.primary
                              : Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
          // Calendar Picker Arrow
          GestureDetector(
            onTap: () => _selectDate(context),
            child: Container(
              width: 50.w,
              height: 95.h,
              decoration: BoxDecoration(
                color: Theme.of(
                  context,
                ).colorScheme.onSurface.withValues(alpha: 0.05),
                borderRadius: BorderRadius.circular(25.r),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.03),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Icon(
                Icons
                    .calendar_month_rounded, // Changed to calendar icon for better clarity
                color: Theme.of(context).colorScheme.primary,
                size: 24.sp,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

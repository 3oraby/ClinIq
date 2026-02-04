import 'package:cliniq/features/appointments/presentation/widgets/calendar_day_item.dart';
import 'package:cliniq/features/appointments/presentation/widgets/calendar_picker_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CalendarTimeline extends StatefulWidget {
  final Function(DateTime) onDateSelected;
  const CalendarTimeline({super.key, required this.onDateSelected});

  @override
  State<CalendarTimeline> createState() => _CalendarTimelineState();
}

class _CalendarTimelineState extends State<CalendarTimeline> {
  DateTime selectedDate = DateTime.now();
  late List<DateTime> constantDays;

  @override
  void initState() {
    super.initState();
    _generateConstantDays();
  }

  void _generateConstantDays() {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    // Generate 4 dates starting from Today
    constantDays = List.generate(
      4,
      (index) => today.add(Duration(days: index)),
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);

    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate.isBefore(today) ? today : selectedDate,
      firstDate: today,
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
      });
      widget.onDateSelected(picked);
    }
  }

  @override
  Widget build(BuildContext context) {
    bool isCustomDateSelected = true;
    for (var day in constantDays) {
      if (DateUtils.isSameDay(day, selectedDate)) {
        isCustomDateSelected = false;
        break;
      }
    }

    final pickerButton = CalendarPickerButton(
      onTap: () => _selectDate(context),
    );

    if (!isCustomDateSelected) {
      return Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ...constantDays.map(
              (day) => CalendarDayItem(
                day: day,
                isSelected: DateUtils.isSameDay(day, selectedDate),
                onTap: () {
                  setState(() {
                    selectedDate = day;
                  });
                  widget.onDateSelected(day);
                },
              ),
            ),
            pickerButton,
          ],
        ),
      );
    }

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            ...constantDays.map(
              (day) => Padding(
                padding: EdgeInsets.only(right: 12.w),
                child: CalendarDayItem(
                  day: day,
                  isSelected: DateUtils.isSameDay(day, selectedDate),
                  onTap: () {
                    setState(() {
                      selectedDate = day;
                    });
                    widget.onDateSelected(day);
                  },
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.w),
              child: Container(
                width: 1.w,
                height: 40.h,
                color: Theme.of(context).dividerColor.withValues(alpha: 0.1),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(right: 12.w),
              child: CalendarDayItem(
                day: selectedDate,
                isSelected: true,
                onTap: () {},
              ),
            ),
            pickerButton,
          ],
        ),
      ),
    );
  }
}

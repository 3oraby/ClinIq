class DoctorScheduleEntity {
  final List<WorkingDayRangeEntity> weeklySchedule;
  final List<DoctorDateAvailabilityEntity> dates;

  DoctorScheduleEntity({required this.weeklySchedule, required this.dates});
}

class WorkingDayRangeEntity {
  final String day;
  final String range;

  WorkingDayRangeEntity({required this.day, required this.range});
}

class DoctorDateAvailabilityEntity {
  final String day;
  final String date;
  final String month;
  final String fullDate;
  final String patientCount;
  final bool isFull;

  DoctorDateAvailabilityEntity({
    required this.day,
    required this.date,
    required this.month,
    required this.fullDate,
    required this.patientCount,
    required this.isFull,
  });
}

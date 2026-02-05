import 'package:cliniq/features/appointments/domain/entities/doctor_schedule_entity.dart';
import 'package:cliniq/features/home/domain/entities/doctor_entity.dart';

class DoctorDetailEntity {
  final DoctorEntity doctor;
  final DoctorScheduleEntity schedule;

  DoctorDetailEntity({required this.doctor, required this.schedule});
}

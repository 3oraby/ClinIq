import 'package:cliniq/core/errors/failures.dart';
import 'package:cliniq/features/appointments/domain/entities/doctor_schedule_entity.dart';
import 'package:cliniq/features/home/domain/entities/examination_appointment_entity.dart';
import 'package:dartz/dartz.dart';

abstract class AppointmentsRepo {
  Future<Either<Failure, List<ExaminationAppointmentEntity>>>
  getAvailableDoctors(String date);

  Future<Either<Failure, DoctorScheduleEntity>> getDoctorWorkingHours({
    required String doctorId,
    required String date,
  });

  Future<Either<Failure, void>> bookAppointment({
    required String doctorId,
    required String date,
    required String time,
  });
}

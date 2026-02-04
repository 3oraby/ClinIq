import 'package:cliniq/core/errors/failures.dart';
import 'package:cliniq/features/home/domain/entities/examination_appointment_entity.dart';
import 'package:dartz/dartz.dart';

abstract class AppointmentsRepo {
  Future<Either<Failure, List<ExaminationAppointmentEntity>>>
  getAvailableDoctors(String date);
}

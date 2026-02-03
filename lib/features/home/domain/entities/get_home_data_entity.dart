import 'package:cliniq/features/home/domain/entities/doctor_entity.dart';
import 'package:cliniq/features/home/domain/entities/examination_appointment_entity.dart';
import 'package:cliniq/features/home/domain/entities/news_entity.dart';
import 'package:cliniq/features/home/domain/entities/specialization_entity.dart';

class GetHomeDataEntity {
  final List<SpecializationEntity> specializations;
  final List<DoctorEntity> suggestedDoctors;
  final List<NewsEntity> news;
  final List<ExaminationAppointmentEntity> examinationAppointments;

  GetHomeDataEntity({
    required this.specializations,
    required this.suggestedDoctors,
    required this.news,
    required this.examinationAppointments,
  });
}

import 'package:cliniq/core/errors/failures.dart';
import 'package:cliniq/features/home/domain/entities/doctor_entity.dart';
import 'package:cliniq/features/home/domain/entities/examination_appointment_entity.dart';
import 'package:cliniq/features/home/domain/entities/get_home_data_entity.dart';
import 'package:cliniq/features/home/domain/entities/news_entity.dart';
import 'package:cliniq/features/home/domain/entities/specialization_entity.dart';
import 'package:dartz/dartz.dart';

abstract class HomeRepo {
  Future<Either<Failure, List<SpecializationEntity>>> getSpecializations();
  Future<Either<Failure, List<DoctorEntity>>> getSuggestedDoctors();
  Future<Either<Failure, List<NewsEntity>>> getNews();
  Future<Either<Failure, List<ExaminationAppointmentEntity>>>
  getExaminationAppointments();

  Future<Either<Failure, GetHomeDataEntity>> getHomeData();
}

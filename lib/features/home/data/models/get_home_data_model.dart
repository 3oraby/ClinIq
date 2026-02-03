import 'package:cliniq/features/home/data/models/doctor_model.dart';
import 'package:cliniq/features/home/data/models/examination_appointment_model.dart';
import 'package:cliniq/features/home/data/models/news_model.dart';
import 'package:cliniq/features/home/data/models/specialization_model.dart';
import 'package:cliniq/features/home/domain/entities/get_home_data_entity.dart';

class GetHomeDataModel extends GetHomeDataEntity {
  GetHomeDataModel({
    required super.specializations,
    required super.suggestedDoctors,
    required super.news,
    required super.examinationAppointments,
  });

  factory GetHomeDataModel.fromJson(Map<String, dynamic> json) {
    return GetHomeDataModel(
      specializations: (json['specializations'] as List)
          .map((e) => SpecializationModel.fromJson(e))
          .toList(),
      suggestedDoctors: (json['suggestedDoctors'] as List)
          .map((e) => DoctorModel.fromJson(e))
          .toList(),
      news: (json['news'] as List).map((e) => NewsModel.fromJson(e)).toList(),
      examinationAppointments: (json['examinationAppointments'] as List)
          .map((e) => ExaminationAppointmentModel.fromJson(e))
          .toList(),
    );
  }

  factory GetHomeDataModel.fromEntity(GetHomeDataEntity entity) {
    return GetHomeDataModel(
      specializations: entity.specializations,
      suggestedDoctors: entity.suggestedDoctors,
      news: entity.news,
      examinationAppointments: entity.examinationAppointments,
    );
  }

  toEntity() {
    return GetHomeDataEntity(
      specializations: specializations,
      suggestedDoctors: suggestedDoctors,
      news: news,
      examinationAppointments: examinationAppointments,
    );
  }
}

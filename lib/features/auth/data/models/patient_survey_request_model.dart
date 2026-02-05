import '../../domain/entities/patient_survey_request_entity.dart';

class PatientSurveyRequestModel {
  final double? height;
  final double? weight;
  final bool hasDiabetes;
  final bool hasPressureIssues;
  final String? bloodType;
  final String? allergies;
  final String? chronicConditions;
  final String? emergencyContactName;
  final String? emergencyContactPhone;

  PatientSurveyRequestModel({
    this.height,
    this.weight,
    required this.hasDiabetes,
    required this.hasPressureIssues,
    this.bloodType,
    this.allergies,
    this.chronicConditions,
    this.emergencyContactName,
    this.emergencyContactPhone,
  });

  factory PatientSurveyRequestModel.fromEntity(
    PatientSurveyRequestEntity entity,
  ) {
    return PatientSurveyRequestModel(
      height: entity.height,
      weight: entity.weight,
      hasDiabetes: entity.hasDiabetes,
      hasPressureIssues: entity.hasPressureIssues,
      bloodType: entity.bloodType,
      allergies: entity.allergies,
      chronicConditions: entity.chronicConditions,
      emergencyContactName: entity.emergencyContactName,
      emergencyContactPhone: entity.emergencyContactPhone,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'height': height,
      'weight': weight,
      'hasDiabetes': hasDiabetes,
      'hasPressureIssues': hasPressureIssues,
      'bloodType': bloodType,
      'allergies': allergies,
      'chronicConditions': chronicConditions,
      'emergencyContactName': emergencyContactName,
      'emergencyContactPhone': emergencyContactPhone,
    };
  }
}

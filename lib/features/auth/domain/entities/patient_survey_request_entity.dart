class PatientSurveyRequestEntity {
  final double? height;
  final double? weight;
  final bool hasDiabetes;
  final bool hasPressureIssues;
  final String? bloodType;
  final String? allergies;
  final String? chronicConditions;
  final String? emergencyContactName;
  final String? emergencyContactPhone;

  const PatientSurveyRequestEntity({
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
}

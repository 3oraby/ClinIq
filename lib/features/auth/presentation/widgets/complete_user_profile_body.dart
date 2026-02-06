import 'package:cliniq/core/constants/dropdown_options.dart';
import 'package:cliniq/core/constants/locale_keys.dart';
import 'package:cliniq/core/utils/app_routes.dart';
import 'package:cliniq/core/widgets/custom_button.dart';
import 'package:cliniq/core/widgets/custom_divider.dart';
import 'package:cliniq/core/widgets/custom_switch_tile.dart';
import 'package:cliniq/core/widgets/vertical_gap.dart';
import 'package:cliniq/features/auth/data/models/patient_survey_request_model.dart';
import 'package:cliniq/features/auth/domain/entities/patient_survey_request_entity.dart';
import 'package:cliniq/features/auth/presentation/providers/complete_profile_provider.dart';
import 'package:cliniq/core/utils/app_theme_extension.dart';
import 'package:cliniq/core/widgets/form_section_header.dart';
import 'package:cliniq/core/widgets/labeled_dropdown_form_field.dart';
import 'package:cliniq/core/widgets/labeled_form_field.dart';
import 'package:cliniq/core/widgets/custom_card_section.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CompleteProfileBody extends ConsumerStatefulWidget {
  const CompleteProfileBody({super.key});

  @override
  ConsumerState<CompleteProfileBody> createState() =>
      _CompleteProfileBodyState();
}

class _CompleteProfileBodyState extends ConsumerState<CompleteProfileBody> {
  final heightController = TextEditingController();
  final weightController = TextEditingController();
  final allergiesController = TextEditingController();
  final chronicController = TextEditingController();
  final emergencyNameController = TextEditingController();
  final emergencyPhoneController = TextEditingController();

  bool hasDiabetes = false;
  bool hasPressure = false;
  String? bloodType;

  final formKey = GlobalKey<FormState>();

  void onSubmit() {
    final entity = PatientSurveyRequestEntity(
      height: double.tryParse(heightController.text),
      weight: double.tryParse(weightController.text),
      hasDiabetes: hasDiabetes,
      hasPressureIssues: hasPressure,
      bloodType: bloodType,
      allergies: allergiesController.text,
      chronicConditions: chronicController.text,
      emergencyContactName: emergencyNameController.text,
      emergencyContactPhone: emergencyPhoneController.text,
    );

    ref
        .read(completeProfileProvider.notifier)
        .submitProfile(
          data: PatientSurveyRequestModel.fromEntity(entity).toJson(),
        );
  }

  void onSkip() {
    Navigator.pushReplacementNamed(context, Routes.userHomeScreen);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      padding: EdgeInsets.zero,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 24.h),
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FormSectionHeader(
                title: LocaleKeys.completeProfileGeneralInfo,
                description: LocaleKeys.completeProfileGeneralInfoDesc,
                icon: Icons.person_add_alt_1_rounded,
              ).animate().fadeIn(delay: 400.ms).slideX(begin: -0.1),
              const VerticalGap(12),
              CustomCardSection(
                children: [
                  LabeledFormField(
                    controller: heightController,
                    label: LocaleKeys.completeProfileHeight,
                    hint: LocaleKeys.completeProfileHeightHint,
                    keyboardType: TextInputType.number,
                    prefixIcon: Icon(
                      Icons.height_rounded,
                      color: context.colorScheme.primary,
                    ),
                  ),
                  const VerticalGap(20),
                  LabeledFormField(
                    controller: weightController,
                    label: LocaleKeys.completeProfileWeight,
                    hint: LocaleKeys.completeProfileWeightHint,
                    keyboardType: TextInputType.number,
                    prefixIcon: Icon(
                      Icons.monitor_weight_outlined,
                      color: context.colorScheme.primary,
                    ),
                  ),
                  const VerticalGap(20),
                  LabeledDropdownFormField(
                    title: LocaleKeys.completeProfileBloodType,
                    hintText: LocaleKeys.completeProfileBloodTypeHint,
                    items: DropdownOptions.bloodTypes,
                    onChanged: (v) => bloodType = v,
                    prefixIcon: Icon(
                      Icons.bloodtype_rounded,
                      color: context.colorScheme.primary,
                    ),
                  ),
                ],
              ).animate().fadeIn(delay: 500.ms).slideY(begin: 0.05),
              const VerticalGap(24),
              FormSectionHeader(
                title: LocaleKeys.completeProfileMedicalHistory,
                description: LocaleKeys.completeProfileMedicalHistoryDesc,
                icon: Icons.history_edu_rounded,
              ).animate().fadeIn(delay: 600.ms).slideX(begin: -0.1),
              const VerticalGap(12),
              CustomCardSection(
                children: [
                  LabeledFormField(
                    controller: allergiesController,
                    label: LocaleKeys.completeProfileAllergies,
                    hint: LocaleKeys.completeProfileAllergiesHint,
                    prefixIcon: Icon(
                      Icons.warning_amber_rounded,
                      color: context.colorScheme.primary,
                    ),
                  ),
                  const VerticalGap(20),
                  LabeledFormField(
                    controller: chronicController,
                    label: LocaleKeys.completeProfileChronicConditions,
                    hint: LocaleKeys.completeProfileChronicConditionsHint,
                    prefixIcon: Icon(
                      Icons.medical_information_rounded,
                      color: context.colorScheme.primary,
                    ),
                  ),
                ],
              ).animate().fadeIn(delay: 700.ms).slideY(begin: 0.05),
              const VerticalGap(24),
              FormSectionHeader(
                title: LocaleKeys.completeProfileEmergencyContact,
                description: LocaleKeys.completeProfileEmergencyContactDesc,
                icon: Icons.contact_emergency_rounded,
              ).animate().fadeIn(delay: 800.ms).slideX(begin: -0.1),
              const VerticalGap(12),
              CustomCardSection(
                children: [
                  LabeledFormField(
                    controller: emergencyNameController,
                    label: LocaleKeys.completeProfileEmergencyContactName,
                    hint: LocaleKeys.completeProfileEmergencyContactNameHint,
                    prefixIcon: Icon(
                      Icons.person_pin_rounded,
                      color: context.colorScheme.primary,
                    ),
                  ),
                  const VerticalGap(20),
                  LabeledFormField(
                    controller: emergencyPhoneController,
                    label: LocaleKeys.completeProfileEmergencyContactPhone,
                    hint: LocaleKeys.completeProfileEmergencyContactPhoneHint,
                    keyboardType: TextInputType.phone,
                    prefixIcon: Icon(
                      Icons.phone_rounded,
                      color: context.colorScheme.primary,
                    ),
                  ),
                ],
              ).animate().fadeIn(delay: 900.ms).slideY(begin: 0.05),
              const VerticalGap(24),
              FormSectionHeader(
                title: LocaleKeys.completeProfileHealthStatus,
                description: LocaleKeys.completeProfileHealthStatusDesc,
                icon: Icons.health_and_safety_rounded,
              ).animate().fadeIn(delay: 1000.ms).slideX(begin: -0.1),
              const VerticalGap(12),
              CustomCardSection(
                children: [
                  CustomSwitchTile(
                    title: LocaleKeys.completeProfileHasDiabetes.tr(),
                    value: hasDiabetes,
                    onChanged: (v) => setState(() => hasDiabetes = v),
                  ),
                  const CustomDivider(),
                  CustomSwitchTile(
                    title: LocaleKeys.completeProfileHasPressure.tr(),
                    value: hasPressure,
                    onChanged: (v) => setState(() => hasPressure = v),
                  ),
                ],
              ).animate().fadeIn(delay: 1100.ms).slideY(begin: 0.05),
              const VerticalGap(40),
              CustomButton(
                onPressed: onSubmit,
                text: LocaleKeys.completeProfileSubmit,
              ).animate().fadeIn(delay: 1200.ms).scale(),
              const VerticalGap(24),
            ],
          ),
        ),
      ),
    );
  }
}

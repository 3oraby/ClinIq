import 'package:cliniq/core/constants/locale_keys.dart';
import 'package:cliniq/core/utils/app_routes.dart';
import 'package:cliniq/core/utils/app_theme_extension.dart';
import 'package:cliniq/core/widgets/custom_button.dart';
import 'package:cliniq/core/widgets/custom_switch_tile.dart';
import 'package:cliniq/core/widgets/vertical_gap.dart';
import 'package:cliniq/features/auth/data/models/patient_survey_request_model.dart';
import 'package:cliniq/features/auth/domain/entities/patient_survey_request_entity.dart';
import 'package:cliniq/features/auth/presentation/providers/complete_profile_provider.dart';
import 'package:cliniq/features/auth/presentation/widgets/labeled_dropdown_form_field.dart';
import 'package:cliniq/features/auth/presentation/widgets/labeled_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
      child: Form(
        key: formKey,
        child: Column(
          children: [
            _FormCard(
              children: [
                LabeledFormField(
                  controller: heightController,
                  label: LocaleKeys.completeProfileHeight,
                  hint: LocaleKeys.completeProfileHeightHint,
                  keyboardType: TextInputType.number,
                ),
                const VerticalGap(16),
                LabeledFormField(
                  controller: weightController,
                  label: LocaleKeys.completeProfileWeight,
                  hint: LocaleKeys.completeProfileWeightHint,
                  keyboardType: TextInputType.number,
                ),
              ],
            ),

            const VerticalGap(24),

            _FormCard(
              children: [
                LabeledDropdownFormField(
                  title: LocaleKeys.completeProfileBloodType,
                  hintText: LocaleKeys.completeProfileBloodTypeHint,
                  items: const [
                    'A+',
                    'A-',
                    'B+',
                    'B-',
                    'AB+',
                    'AB-',
                    'O+',
                    'O-',
                  ],
                  onChanged: (v) => bloodType = v,
                ),
              ],
            ),

            const VerticalGap(24),
            _FormCard(
              children: [
                CustomSwitchTile(
                  title: LocaleKeys.completeProfileHasDiabetes,
                  value: hasDiabetes,
                  onChanged: (v) => setState(() => hasDiabetes = v),
                ),
                const Divider(),
                CustomSwitchTile(
                  title: LocaleKeys.completeProfileHasPressure,
                  value: hasPressure,
                  onChanged: (v) => setState(() => hasPressure = v),
                ),
              ],
            ),

            const VerticalGap(24),

            _FormCard(
              children: [
                LabeledFormField(
                  controller: allergiesController,
                  label: LocaleKeys.completeProfileAllergies,
                  hint: LocaleKeys.completeProfileAllergiesHint,
                ),
                const VerticalGap(16),
                LabeledFormField(
                  controller: chronicController,
                  label: LocaleKeys.completeProfileChronicConditions,
                  hint: LocaleKeys.completeProfileChronicConditionsHint,
                ),
              ],
            ),

            const VerticalGap(24),

            _FormCard(
              children: [
                LabeledFormField(
                  controller: emergencyNameController,
                  label: LocaleKeys.completeProfileEmergencyContactName,
                  hint: LocaleKeys.completeProfileEmergencyContactNameHint,
                ),
                const VerticalGap(16),
                LabeledFormField(
                  controller: emergencyPhoneController,
                  label: LocaleKeys.completeProfileEmergencyContactPhone,
                  hint: LocaleKeys.completeProfileEmergencyContactPhoneHint,
                  keyboardType: TextInputType.phone,
                ),
              ],
            ),

            const VerticalGap(32),

            CustomButton(
              onPressed: onSubmit,
              text: LocaleKeys.completeProfileSubmit,
            ),
          ],
        ),
      ),
    );
  }
}

class _FormCard extends StatelessWidget {
  final List<Widget> children;

  const _FormCard({required this.children});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: context.theme.cardColor,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.04),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(children: children),
    );
  }
}

import 'package:cliniq/core/constants/locale_keys.dart';
import 'package:cliniq/core/widgets/custom_card_section.dart';
import 'package:cliniq/core/widgets/form_section_header.dart';
import 'package:cliniq/core/widgets/horizontal_gap.dart';
import 'package:cliniq/core/widgets/labeled_form_field.dart';
import 'package:flutter/material.dart';

class EditPhysicalMetricsSection extends StatelessWidget {
  const EditPhysicalMetricsSection({
    super.key,
    required this.heightController,
    required this.weightController,
  });

  final TextEditingController heightController;
  final TextEditingController weightController;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const FormSectionHeader(
          title: LocaleKeys.profileUserPhysicalMetrics,
          icon: Icons.monitor_weight_outlined,
        ),
        CustomCardSection(
          children: [
            Row(
              children: [
                Expanded(
                  child: LabeledFormField(
                    controller: heightController,
                    label: LocaleKeys.profileUserHeight,
                    hint: LocaleKeys.profileUserCm,
                    keyboardType: TextInputType.number,
                  ),
                ),
                const HorizontalGap(16),
                Expanded(
                  child: LabeledFormField(
                    controller: weightController,
                    label: LocaleKeys.profileUserWeight,
                    hint: LocaleKeys.profileUserKg,
                    keyboardType: TextInputType.number,
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}

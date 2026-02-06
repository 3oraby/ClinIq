import 'package:cliniq/core/constants/locale_keys.dart';
import 'package:cliniq/core/widgets/custom_card_section.dart';
import 'package:cliniq/core/widgets/form_section_header.dart';
import 'package:cliniq/core/widgets/labeled_form_field.dart';
import 'package:cliniq/core/widgets/vertical_gap.dart';
import 'package:flutter/material.dart';

class EditPersonalInfoSection extends StatelessWidget {
  const EditPersonalInfoSection({
    super.key,
    required this.nameController,
    required this.emailController,
    required this.mobileController,
  });

  final TextEditingController nameController;
  final TextEditingController emailController;
  final TextEditingController mobileController;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const FormSectionHeader(
          title: LocaleKeys.profileUserPersonalInfo,
          icon: Icons.person_outline_rounded,
        ),
        CustomCardSection(
          children: [
            LabeledFormField(
              controller: nameController,
              label: LocaleKeys.profileUserFullName,
              hint: LocaleKeys.signupUserNameHint,
            ),
            const VerticalGap(20),
            LabeledFormField(
              controller: emailController,
              label: LocaleKeys.profileUserEmail,
              hint: LocaleKeys.signupUserEmailHint,
              keyboardType: TextInputType.emailAddress,
            ),
            const VerticalGap(20),
            LabeledFormField(
              controller: mobileController,
              label: LocaleKeys.profileUserMobile,
              hint: LocaleKeys.signupUserPhoneHint,
              keyboardType: TextInputType.phone,
            ),
          ],
        ),
      ],
    );
  }
}

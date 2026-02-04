import 'package:cliniq/core/utils/app_text_styles.dart';
import 'package:cliniq/core/utils/app_theme_extension.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class TermsAndConditionsScreen extends StatelessWidget {
  const TermsAndConditionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "settings.terms_and_services".tr(),
          style: AppTextStyles.getTextStyle(20, fontFamily: 'Poppins').copyWith(
            fontWeight: FontWeight.w700,
            color: context.colorScheme.onBackground,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Text(
          "Terms and Services Content Placeholder...\n\nLorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
          style: AppTextStyles.getTextStyle(
            16,
          ).copyWith(color: context.colorScheme.onBackground, height: 1.5),
        ),
      ),
    );
  }
}

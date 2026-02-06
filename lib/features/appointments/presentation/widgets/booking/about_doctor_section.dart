import 'package:cliniq/core/constants/locale_keys.dart';
import 'package:cliniq/core/utils/app_text_styles.dart';
import 'package:cliniq/core/utils/app_theme_extension.dart';
import 'package:cliniq/core/widgets/custom_card_section.dart';
import 'package:cliniq/core/widgets/vertical_gap.dart';
import 'package:cliniq/core/widgets/horizontal_gap.dart';
import 'package:cliniq/features/home/domain/entities/doctor_entity.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AboutDoctorSection extends StatelessWidget {
  final DoctorEntity doctor;

  const AboutDoctorSection({super.key, required this.doctor});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(
              Icons.info_outline_rounded,
              color: context.colorScheme.primary,
              size: 20.sp,
            ),
            const HorizontalGap(8),
            Text(
              LocaleKeys.bookingAbout.tr(),
              style: AppTextStyles.getTextStyle(18).copyWith(
                fontWeight: FontWeight.w800,
                color: context.textPalette.primaryColor,
              ),
            ),
          ],
        ).animate().fadeIn(delay: 500.ms),
        const VerticalGap(16),
        CustomCardSection(
          children: [
            Text(
              "Dr. ${doctor.name} is a highly skilled ${doctor.speciality} with over ${doctor.experience} of experience. dedicated to providing compassionate care to all patients. has received numerous awards for contributions to medical research and patient advocacy.",
              style: AppTextStyles.getTextStyle(14).copyWith(
                color: context.textPalette.secondaryColor,
                height: 1.6,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ).animate().fadeIn(delay: 600.ms).slideY(begin: 0.1),
      ],
    );
  }
}

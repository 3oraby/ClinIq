import 'package:cliniq/core/utils/app_text_styles.dart';
import 'package:cliniq/core/utils/app_theme_extension.dart';
import 'package:cliniq/core/widgets/vertical_gap.dart';
import 'package:cliniq/features/appointments/presentation/widgets/appointment_card.dart';
import 'package:cliniq/features/home/domain/entities/examination_appointment_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AvailableDoctorsSection extends StatelessWidget {
  final AsyncValue<List<ExaminationAppointmentEntity>> doctorsAsync;

  const AvailableDoctorsSection({super.key, required this.doctorsAsync});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Text(
              'Available Doctor',
              style: AppTextStyles.getTextStyle(18).copyWith(
                fontWeight: FontWeight.bold,
                color: context.textPalette.primaryColor,
              ),
            ),
          ),
          const VerticalGap(16),
          Expanded(
            child: doctorsAsync.when(
              data: (doctors) => ListView.builder(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                itemCount: doctors.length,
                itemBuilder: (context, index) {
                  return AppointmentCard(appointment: doctors[index]);
                },
              ),
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (error, _) => Center(child: Text(error.toString())),
            ),
          ),
        ],
      ),
    );
  }
}

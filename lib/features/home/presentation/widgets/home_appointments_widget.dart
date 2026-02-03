import 'package:cached_network_image/cached_network_image.dart';
import 'package:cliniq/core/utils/app_text_styles.dart';
import 'package:cliniq/core/utils/app_theme_extension.dart';
import 'package:cliniq/features/home/domain/entities/examination_appointment_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeAppointmentsWidget extends StatelessWidget {
  const HomeAppointmentsWidget({super.key, required this.appointments});

  final List<ExaminationAppointmentEntity> appointments;

  @override
  Widget build(BuildContext context) {
    if (appointments.isEmpty) return const SizedBox.shrink();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            'Upcoming Appointments',
            style: AppTextStyles.getTextStyle(16).copyWith(
              fontWeight: FontWeight.w700,
              color: context.textPalette.primaryColor,
            ),
          ),
        ),
        ListView.separated(
          padding: const EdgeInsets.all(20),
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: appointments.length,
          separatorBuilder: (context, index) => SizedBox(height: 16.h),
          itemBuilder: (context, index) {
            final appointment = appointments[index];
            return Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: context.colorScheme.primary,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: context.colorScheme.primary.withOpacity(0.3),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: CachedNetworkImage(
                      imageUrl: appointment.doctorImage,
                      width: 60.w,
                      height: 60.w,
                      fit: BoxFit.cover,
                      placeholder: (context, url) => Container(
                        color: Colors.white.withOpacity(0.2),
                        child: const Center(
                          child: CircularProgressIndicator(color: Colors.white),
                        ),
                      ),
                      errorWidget: (context, url, error) =>
                          const Icon(Icons.person, color: Colors.white),
                    ),
                  ),
                  SizedBox(width: 16.w),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          appointment.doctorName,
                          style: AppTextStyles.getTextStyle(16).copyWith(
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          appointment.doctorSpeciality,
                          style: AppTextStyles.getTextStyle(
                            12,
                          ).copyWith(color: Colors.white.withOpacity(0.8)),
                        ),
                        SizedBox(height: 8.h),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 6,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Icon(
                                Icons.calendar_today,
                                color: Colors.white,
                                size: 14,
                              ),
                              SizedBox(width: 6.w),
                              Text(
                                '${appointment.appointmentDate} • ${appointment.appointmentTime}',
                                style: AppTextStyles.getTextStyle(12).copyWith(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ],
    );
  }
}

import 'package:cached_network_image/cached_network_image.dart';
import 'package:cliniq/core/utils/app_text_styles.dart';
import 'package:cliniq/core/utils/app_theme_extension.dart';
import 'package:cliniq/core/widgets/vertical_gap.dart';
import 'package:cliniq/features/appointments/domain/entities/doctor_detail_entity.dart';
import 'package:cliniq/features/appointments/presentation/widgets/booking/info_chip.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DoctorDetailHeader extends StatelessWidget {
  final AsyncValue<DoctorDetailEntity> doctorDetailAsync;

  const DoctorDetailHeader({super.key, required this.doctorDetailAsync});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.only(bottom: 30.h),
      decoration: BoxDecoration(
        color: context.colorScheme.primary,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(30.r),
          bottomRight: Radius.circular(30.r),
        ),
      ),
      child: Column(
        children: [
          doctorDetailAsync.when(
            data: (detail) => Column(
              children: [
                Container(
                  width: 100.w,
                  height: 100.w,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.white, width: 3),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.1),
                        blurRadius: 10,
                      ),
                    ],
                  ),
                  child: ClipOval(
                    child: CachedNetworkImage(
                      imageUrl: detail.doctor.image,
                      fit: BoxFit.cover,
                      placeholder: (context, url) =>
                          Container(color: Colors.grey[200]),
                      errorWidget: (context, url, error) =>
                          const Icon(Icons.person, size: 50),
                    ),
                  ),
                ),
                const VerticalGap(16),
                Text(
                  detail.doctor.name,
                  style: AppTextStyles.getTextStyle(
                    22,
                  ).copyWith(color: Colors.white, fontWeight: FontWeight.bold),
                ),
                const VerticalGap(4),
                Text(
                  detail.doctor.speciality,
                  style: AppTextStyles.getTextStyle(
                    16,
                  ).copyWith(color: Colors.white.withValues(alpha: 0.8)),
                ),
                const VerticalGap(12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InfoChip(
                      icon: Icons.star,
                      label: detail.doctor.rating,
                      color: Colors.amber,
                    ),
                    SizedBox(width: 15.w),
                    InfoChip(
                      icon: Icons.work,
                      label: detail.doctor.experience,
                      color: Colors.white,
                    ),
                    SizedBox(width: 15.w),
                    InfoChip(
                      icon: Icons.people,
                      label: detail.doctor.numberOfAppointments,
                      color: Colors.white,
                    ),
                  ],
                ),
              ],
            ),
            loading: () => const Center(
              child: CircularProgressIndicator(color: Colors.white),
            ),
            error: (error, _) => const SizedBox.shrink(),
          ),
        ],
      ),
    );
  }
}

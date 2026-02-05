import 'package:cached_network_image/cached_network_image.dart';
import 'package:cliniq/core/constants/locale_keys.dart';
import 'package:cliniq/core/helpers/show_custom_snack_bar.dart';
import 'package:cliniq/core/utils/app_text_styles.dart';
import 'package:cliniq/core/utils/app_theme_extension.dart';
import 'package:cliniq/core/utils/success.dart';
import 'package:cliniq/core/widgets/vertical_gap.dart';
import 'package:cliniq/features/appointments/presentation/providers/book_appointment_provider.dart';
import 'package:cliniq/features/appointments/presentation/providers/get_doctor_by_id_provider.dart';
import 'package:cliniq/features/home/domain/entities/examination_appointment_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BookingScreen extends ConsumerStatefulWidget {
  final ExaminationAppointmentEntity doctor;

  const BookingScreen({super.key, required this.doctor});

  @override
  ConsumerState<BookingScreen> createState() => _BookingScreenState();
}

class _BookingScreenState extends ConsumerState<BookingScreen> {
  String? selectedFullDate;

  @override
  Widget build(BuildContext context) {
    final doctorDetailAsync = ref.watch(
      getDoctorByIdProvider(widget.doctor.id),
    );

    ref.listen(bookAppointmentProvider, (previous, next) {
      if (next is AsyncError) {
        showCustomSnackBar(context, next.error.toString());
      } else if (next is AsyncData && next.value is Success) {
        showCustomSnackBar(
          context,
          LocaleKeys.messagesSuccessAppointmentBookedSuccessfully,
        );
      }
    });

    final bookingState = ref.watch(bookAppointmentProvider);
    final isBookingLoading = bookingState.isLoading;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Booking',
          style: AppTextStyles.getTextStyle(
            20,
          ).copyWith(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: context.colorScheme.primary,
        centerTitle: true,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new,
            color: Colors.white,
            size: 20,
          ),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
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
                          style: AppTextStyles.getTextStyle(22).copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const VerticalGap(4),
                        Text(
                          detail.doctor.speciality,
                          style: AppTextStyles.getTextStyle(16).copyWith(
                            color: Colors.white.withValues(alpha: 0.8),
                          ),
                        ),
                        const VerticalGap(12),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            _buildInfoChip(
                              Icons.star,
                              detail.doctor.rating,
                              Colors.amber,
                            ),
                            SizedBox(width: 15.w),
                            _buildInfoChip(
                              Icons.work,
                              detail.doctor.experience,
                              Colors.white,
                            ),
                            SizedBox(width: 15.w),
                            _buildInfoChip(
                              Icons.people,
                              detail.doctor.numberOfAppointments,
                              Colors.white,
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
            ),
            Padding(
              padding: EdgeInsets.all(20.w),
              child: doctorDetailAsync.when(
                data: (detail) {
                  final schedule = detail.schedule;
                  final doctor = detail.doctor;
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'About Doctor',
                        style: AppTextStyles.getTextStyle(
                          18,
                        ).copyWith(fontWeight: FontWeight.bold),
                      ),
                      const VerticalGap(12),
                      Text(
                        "Dr. ${doctor.name} is a highly skilled ${doctor.speciality} with over ${doctor.experience} of experience. dedicated to providing compassionate care to all patients. has received numerous awards for contributions to medical research and patient advocacy.",
                        style: AppTextStyles.getTextStyle(14).copyWith(
                          color: context.textPalette.secondaryColor,
                          height: 1.5,
                        ),
                      ),
                      const VerticalGap(40),
                      Text(
                        'Working hours',
                        style: AppTextStyles.getTextStyle(
                          18,
                        ).copyWith(fontWeight: FontWeight.bold),
                      ),
                      const VerticalGap(12),
                      ...schedule.weeklySchedule.map(
                        (item) => Padding(
                          padding: EdgeInsets.only(bottom: 8.h),
                          child: Text(
                            "${item.day} ( ${item.range} )",
                            style: AppTextStyles.getTextStyle(14).copyWith(
                              color: context.textPalette.secondaryColor,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                      const VerticalGap(24),
                      // Date selection cards
                      SizedBox(
                        height: 120.h,
                        child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          itemCount: schedule.dates.length,
                          separatorBuilder: (context, index) =>
                              SizedBox(width: 16.w),
                          itemBuilder: (context, index) {
                            final dateItem = schedule.dates[index];
                            final isSelected =
                                selectedFullDate == dateItem.fullDate;
                            final primaryColor = context.colorScheme.primary;

                            return GestureDetector(
                              onTap: () {
                                if (!dateItem.isFull) {
                                  setState(
                                    () => selectedFullDate = dateItem.fullDate,
                                  );
                                }
                              },
                              child: Container(
                                width: 100.w,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(20.r),
                                  border: isSelected
                                      ? Border.all(
                                          color: primaryColor,
                                          width: 2,
                                        )
                                      : Border.all(
                                          color: context.theme.dividerColor
                                              .withValues(alpha: 0.1),
                                        ),
                                ),
                                child: Column(
                                  children: [
                                    Expanded(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            dateItem.day,
                                            style:
                                                AppTextStyles.getTextStyle(
                                                  14,
                                                ).copyWith(
                                                  color: context
                                                      .textPalette
                                                      .secondaryColor,
                                                ),
                                          ),
                                          Text(
                                            dateItem.date,
                                            style:
                                                AppTextStyles.getTextStyle(
                                                  18,
                                                ).copyWith(
                                                  fontWeight: FontWeight.bold,
                                                ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      width: double.infinity,
                                      padding: EdgeInsets.symmetric(
                                        vertical: 8.h,
                                      ),
                                      decoration: BoxDecoration(
                                        color: dateItem.isFull
                                            ? Colors.red
                                            : primaryColor,
                                        borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(18.r),
                                          bottomRight: Radius.circular(18.r),
                                        ),
                                      ),
                                      alignment: Alignment.center,
                                      child: Text(
                                        dateItem.isFull
                                            ? "Full"
                                            : "patient ${dateItem.patientCount}",
                                        style: AppTextStyles.getTextStyle(12)
                                            .copyWith(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w500,
                                            ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      const VerticalGap(40),
                      SizedBox(
                        width: double.infinity,
                        height: 55.h,
                        child: ElevatedButton(
                          onPressed:
                              (selectedFullDate == null || isBookingLoading)
                              ? null
                              : () {
                                  ref
                                      .read(bookAppointmentProvider.notifier)
                                      .book(
                                        doctorId: widget.doctor.id,
                                        date: selectedFullDate!,
                                        time: "09:00 AM",
                                      );
                                },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: context.colorScheme.primary,
                            foregroundColor: Colors.white,
                            disabledBackgroundColor: Colors.grey[300],
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.r),
                            ),
                            elevation: 5,
                            shadowColor: context.colorScheme.primary.withValues(
                              alpha: 0.3,
                            ),
                          ),
                          child: isBookingLoading
                              ? const CircularProgressIndicator(
                                  color: Colors.white,
                                )
                              : Text(
                                  'Confirm Booking',
                                  style: AppTextStyles.getTextStyle(
                                    18,
                                  ).copyWith(fontWeight: FontWeight.bold),
                                ),
                        ),
                      ),
                      const VerticalGap(20),
                    ],
                  );
                },
                loading: () => const Center(child: CircularProgressIndicator()),
                error: (error, _) => Center(child: Text(error.toString())),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoChip(IconData icon, String label, Color color) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 6.h),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.2),
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: color, size: 16.sp),
          SizedBox(width: 6.w),
          Text(
            label,
            style: AppTextStyles.getTextStyle(
              12,
            ).copyWith(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}

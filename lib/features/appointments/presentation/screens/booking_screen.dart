import 'package:cliniq/core/constants/locale_keys.dart';
import 'package:cliniq/core/helpers/show_custom_snack_bar.dart';
import 'package:cliniq/core/utils/app_text_styles.dart';
import 'package:cliniq/core/utils/app_theme_extension.dart';
import 'package:cliniq/core/utils/success.dart';
import 'package:cliniq/core/widgets/vertical_gap.dart';
import 'package:cliniq/features/appointments/presentation/providers/book_appointment_provider.dart';
import 'package:cliniq/features/appointments/presentation/providers/get_doctor_by_id_provider.dart';
import 'package:cliniq/features/appointments/presentation/widgets/booking/about_doctor_section.dart';
import 'package:cliniq/features/appointments/presentation/widgets/booking/booking_date_selector.dart';
import 'package:cliniq/features/appointments/presentation/widgets/booking/confirm_booking_button.dart';
import 'package:cliniq/features/appointments/presentation/widgets/booking/doctor_detail_header.dart';
import 'package:cliniq/features/appointments/presentation/widgets/booking/working_hours_section.dart';
import 'package:cliniq/features/home/domain/entities/examination_appointment_entity.dart';
import 'package:easy_localization/easy_localization.dart';
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
        Navigator.pop(context);
      }
    });

    final bookingState = ref.watch(bookAppointmentProvider);
    final isBookingLoading = bookingState.isLoading;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          LocaleKeys.bookingBooking.tr(),
          style: AppTextStyles.getTextStyle(20).copyWith(
            color: context.colorScheme.onPrimary,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: context.colorScheme.primary,
        centerTitle: true,
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_new,
            color: context.colorScheme.onPrimary,
            size: 20,
          ),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DoctorDetailHeader(doctorDetailAsync: doctorDetailAsync),
            Padding(
              padding: EdgeInsets.all(20.w),
              child: doctorDetailAsync.when(
                data: (detail) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AboutDoctorSection(doctor: detail.doctor),
                      const VerticalGap(40),
                      WorkingHoursSection(
                        weeklySchedule: detail.schedule.weeklySchedule,
                      ),
                      const VerticalGap(24),
                      BookingDateSelector(
                        dates: detail.schedule.dates,
                        selectedFullDate: selectedFullDate,
                        onDateSelected: (date) =>
                            setState(() => selectedFullDate = date),
                      ),
                      const VerticalGap(40),
                      ConfirmBookingButton(
                        isLoading: isBookingLoading,
                        isEnabled: selectedFullDate != null,
                        onPressed: () {
                          ref
                              .read(bookAppointmentProvider.notifier)
                              .book(
                                doctorId: widget.doctor.id,
                                date: selectedFullDate!,
                                time: "09:00 AM",
                              );
                        },
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
}

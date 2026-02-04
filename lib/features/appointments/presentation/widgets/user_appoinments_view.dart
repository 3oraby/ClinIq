import 'package:cliniq/core/constants/locale_keys.dart';
import 'package:cliniq/core/utils/app_text_styles.dart';
import 'package:cliniq/core/utils/app_theme_extension.dart';
import 'package:cliniq/core/widgets/vertical_gap.dart';
import 'package:cliniq/features/appointments/presentation/providers/get_available_doctors_provider.dart';
import 'package:cliniq/features/appointments/presentation/widgets/appointment_card.dart';
import 'package:cliniq/features/appointments/presentation/widgets/calendar_timeline.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UserAppointmentsView extends ConsumerStatefulWidget {
  const UserAppointmentsView({super.key});

  @override
  ConsumerState<UserAppointmentsView> createState() =>
      _UserAppointmentsViewState();
}

class _UserAppointmentsViewState extends ConsumerState<UserAppointmentsView> {
  DateTime selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    // Format date for the provider
    final dateString = DateFormat('yyyy-MM-dd').format(selectedDate);
    final availableDoctorsAsync = ref.watch(
      getAvailableDoctorsProvider(dateString),
    );

    return Scaffold(
      appBar: AppBar(
        title: Text(
          LocaleKeys.bookingTitle.tr(),
          style: AppTextStyles.getTextStyle(
            20,
          ).copyWith(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: context.colorScheme.primary,
        centerTitle: true,
        elevation: 0,
        automaticallyImplyLeading: false,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const VerticalGap(20),
          // First thing: Horizontal Calendar
          CalendarTimeline(
            onDateSelected: (date) {
              setState(() {
                selectedDate = date;
              });
            },
          ),
          const VerticalGap(24),
          // Second thing: Available Doctor text
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
          // Third thing: List of Doctors (fetched via provider)
          Expanded(
            child: availableDoctorsAsync.when(
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

import 'package:cliniq/features/appointments/domain/entities/doctor_schedule_entity.dart';
import 'package:cliniq/features/appointments/presentation/providers/appointments_repo_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final getDoctorWorkingHoursProvider =
    FutureProvider.family<
      DoctorScheduleEntity,
      ({String doctorId, String date})
    >((ref, arg) async {
      final repo = ref.watch(appointmentsRepoProvider);
      final result = await repo.getDoctorWorkingHours(
        doctorId: arg.doctorId,
        date: arg.date,
      );
      return result.fold(
        (failure) => throw failure.message,
        (schedule) => schedule,
      );
    });

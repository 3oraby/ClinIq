import 'package:cliniq/core/extensions/either_extensions.dart';
import 'package:cliniq/core/utils/success.dart';
import 'package:cliniq/features/appointments/presentation/providers/appointments_repo_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final bookAppointmentProvider =
    AsyncNotifierProvider.autoDispose<BookAppointmentNotifier, void>(
      BookAppointmentNotifier.new,
    );

class BookAppointmentNotifier extends AsyncNotifier<Success?> {
  @override
  Future<Success?> build() async {
    return null;
  }

  Future<void> book({
    required String doctorId,
    required String date,
    required String time,
  }) async {
    state = const AsyncLoading();
    await ref
        .read(appointmentsRepoProvider)
        .bookAppointment(doctorId: doctorId, date: date, time: time)
        .onSuccess((value) async {
          state = const AsyncData(Success());
        })
        .onFailure((failure) {
          state = AsyncError(failure.message, StackTrace.current);
        });
  }
}

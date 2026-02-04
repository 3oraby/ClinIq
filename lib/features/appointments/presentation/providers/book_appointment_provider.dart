import 'package:cliniq/features/appointments/presentation/providers/appointments_repo_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final bookAppointmentProvider =
    AsyncNotifierProvider.autoDispose<BookAppointmentNotifier, void>(
      BookAppointmentNotifier.new,
    );

class BookAppointmentNotifier extends AsyncNotifier<void> {
  @override
  Future<void> build() async {
    return;
  }

  Future<void> book({
    required String doctorId,
    required String date,
    required String time,
  }) async {
    state = const AsyncLoading();
    final repo = ref.read(appointmentsRepoProvider);
    final result = await repo.bookAppointment(
      doctorId: doctorId,
      date: date,
      time: time,
    );
    result.fold(
      (failure) => state = AsyncError(failure.message, StackTrace.current),
      (success) => state = const AsyncData(null),
    );
  }
}

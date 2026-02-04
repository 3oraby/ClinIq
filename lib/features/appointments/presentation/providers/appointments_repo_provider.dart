import 'package:cliniq/core/services/get_it_service.dart';
import 'package:cliniq/features/appointments/domain/repos/appointments_repo.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final appointmentsRepoProvider = Provider<AppointmentsRepo>((ref) {
  return getIt<AppointmentsRepo>();
});

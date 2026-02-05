import 'package:cliniq/features/appointments/domain/entities/doctor_detail_entity.dart';
import 'package:cliniq/features/appointments/presentation/providers/appointments_repo_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final getDoctorByIdProvider = FutureProvider.family<DoctorDetailEntity, String>(
  (ref, doctorId) async {
    final repo = ref.watch(appointmentsRepoProvider);
    final result = await repo.getDoctorById(doctorId: doctorId);
    return result.fold(
      (failure) => throw failure.message,
      (doctorDetail) => doctorDetail,
    );
  },
);

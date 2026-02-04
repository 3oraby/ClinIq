import 'package:cliniq/core/api/end_points.dart';
import 'package:cliniq/core/errors/failures.dart';
import 'package:cliniq/core/repos/base_repo/base_repo_impl.dart';
import 'package:cliniq/features/appointments/domain/repos/appointments_repo.dart';
import 'package:cliniq/features/home/data/models/examination_appointment_model.dart';
import 'package:cliniq/features/home/domain/entities/examination_appointment_entity.dart';
import 'package:dartz/dartz.dart';

class AppointmentsRepoImpl extends BaseRepoImpl implements AppointmentsRepo {
  AppointmentsRepoImpl({required super.api});

  @override
  Future<Either<Failure, List<ExaminationAppointmentEntity>>>
  getAvailableDoctors(String date) async {
    final result = await handleApi(
      () =>
          api.get(EndPoints.availableDoctors, queryParameters: {'date': date}),
    );
    return result.fold((failure) => Left(failure), (data) {
      final list = (data['data'] as List)
          .map((e) => ExaminationAppointmentModel.fromJson(e))
          .toList();
      return Right(list);
    });
  }
}

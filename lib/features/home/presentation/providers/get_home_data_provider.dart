import 'package:cliniq/core/errors/failures.dart';
import 'package:cliniq/features/home/presentation/providers/get_home_repo_provider.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cliniq/features/home/domain/entities/get_home_data_entity.dart';

final getHomeDataProvider = FutureProvider<Either<Failure, GetHomeDataEntity>>((
  ref,
) {
  return ref.read(getHomeRepoProvider).getHomeData();
});

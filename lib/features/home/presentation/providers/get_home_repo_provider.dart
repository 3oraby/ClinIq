import 'package:cliniq/core/services/get_it_service.dart';
import 'package:cliniq/features/home/domain/repos/home_repo.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final getHomeRepoProvider = Provider<HomeRepo>((ref) {
  return getIt<HomeRepo>();
});

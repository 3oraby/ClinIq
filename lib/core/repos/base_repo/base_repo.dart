import 'package:dartz/dartz.dart';
import 'package:cliniq/core/errors/failures.dart';

abstract class BaseRepo {
  Future<Either<Failure, T>> handleApi<T>(
    Future<T> Function() call, {
    Map<int, String>? statusCodeMessages,
    Map<String, String>? backendMessageMapping,
  });
}

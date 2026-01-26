import 'package:dartz/dartz.dart';

extension FutureEitherX<L, R> on Future<Either<L, R>> {
  Future<Either<L, R>> onSuccess(Future<void> Function(R value) action) async {
    final either = await this;
    return either.fold((l) => Left(l), (r) async {
      await action(r);
      return Right(r);
    });
  }

  Future<Either<L, R>> onFailure(void Function(L failure) action) async {
    final either = await this;
    return either.fold((l) {
      action(l);
      return Left(l);
    }, (r) => Right(r));
  }

  Future<Either<L, void>> asVoid() async {
    final either = await this;
    return either.map((_) {});
  }
}

import 'package:dartz/dartz.dart';
import 'package:test/core/error/failure.dart';

abstract class UseCase<Type> {
  Future<Either<Failure, Type>> call(
    {
    required String email,
    required String password,
  });
}

abstract class UseCaseSingup<Type> {
  Future<Either<Failure, Type>> call({
    required String name,
    required String email,
    required String password,
  });
}

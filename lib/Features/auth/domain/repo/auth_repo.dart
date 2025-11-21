import 'package:dartz/dartz.dart';
import 'package:test/Features/auth/data/model/user_model.dart';
import 'package:test/core/error/failure.dart';

abstract class AuthRepo {
  Future<Either<Failure, UserModel>> login({
    required String email,
    required String password,
  });
  Future<Either<Failure, UserModel>> signup({
    required String email,
    required String password,
    required String name,
  });
}

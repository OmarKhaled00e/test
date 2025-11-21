import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:test/Features/auth/data/data_source/auth_remote_data_source.dart';
import 'package:test/Features/auth/data/model/user_model.dart';
import 'package:test/Features/auth/domain/repo/auth_repo.dart';
import 'package:test/core/error/failure.dart';

class AuthRepoImpl extends AuthRepo {
  final AuthRemoteDataSource authRemoteDataSource;

  AuthRepoImpl({required this.authRemoteDataSource});
  @override
  Future<Either<Failure, UserModel>> signup({
    required String email,
    required String password,
    required String name,
  }) async {
    try {
      final user = await authRemoteDataSource.signup(
        email: email,
        password: password,
        name: name,
      );
      return right(user);
    } catch (e) {
      if (e is DioError) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, UserModel>> login({
    required String email,
    required String password,
  }) async {
    try {
      final user = await authRemoteDataSource.login(
        email: email,
        password: password,
      );
      return right(user);
    } catch (e) {
      if (e is DioError) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }
}

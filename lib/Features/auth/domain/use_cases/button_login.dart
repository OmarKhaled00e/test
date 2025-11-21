import 'package:dartz/dartz.dart';
import 'package:test/Features/auth/data/model/user_model.dart';
import 'package:test/Features/auth/domain/repo/auth_repo.dart';
import 'package:test/core/error/failure.dart';
import 'package:test/core/utils/use_case.dart';

class ButtonLogin extends UseCase<UserModel> {
  final AuthRepo authRepo;

  ButtonLogin({
    required this.authRepo,
  });

  @override
  Future<Either<Failure, UserModel>> call(
    {
    required String email,
    required String password,
  }) async {
    return await authRepo.login(email: email, password: password);
  }
}

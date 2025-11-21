import 'package:dartz/dartz.dart';
import 'package:test/Features/auth/data/model/user_model.dart';
import 'package:test/Features/auth/domain/repo/auth_repo.dart';
import 'package:test/core/error/failure.dart';
import 'package:test/core/utils/use_case.dart';

class ButtonSignup extends UseCaseSingup<UserModel> {
  final AuthRepo authRepo;

  ButtonSignup({required this.authRepo});
  @override
  Future<Either<Failure, UserModel>> call({
    required String name,
    required String email,
    required String password,
  }) async {
    return await authRepo.signup(email: email, password: password, name: name);
  }
}

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';
import 'package:test/Features/auth/data/model/user_model.dart';
import 'package:test/Features/auth/domain/use_cases/button_signup.dart';
import 'package:test/core/error/failure.dart';

part 'signup_state.dart';

class SignupCubit extends Cubit<SignupState> {
  SignupCubit(this.buttonSignup) : super(SignupInitial());
  final ButtonSignup buttonSignup;

  Future<Either<Failure, UserModel>> Signup({
    required String name,
    required String email,
    required String password,
  }) async {
    emit(SignupLoading());
    var result = await buttonSignup.call(
      name: name,
      email: email,
      password: password,
    );
    result.fold(
      (failure) {
        emit(SignupFailure(errMassage: failure.errMassage));
      },
      (user) {
        emit(SignupSuccess(userModel: user));
      },
    );
    return result;
  }
}

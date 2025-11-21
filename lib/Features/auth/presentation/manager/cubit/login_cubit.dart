import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';
import 'package:test/Features/auth/data/model/user_model.dart';
import 'package:test/Features/auth/domain/use_cases/button_login.dart';
import 'package:test/core/error/failure.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this.buttonLogin) : super(LoginInitial());
  final ButtonLogin buttonLogin;

  Future<void> login({
    required String email,
    required String password,
  }) async {
    emit(LoginLoading());

    var result = await buttonLogin.call(email: email, password: password);
    result.fold(
      (failure) {
        emit(LoginFailure(errMasagge: failure.errMassage));
      },
      (user) {
        emit(LoginSuccess(userModal: user));
      },
    );
  }
}

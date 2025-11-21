part of 'login_cubit.dart';

@immutable
sealed class LoginState {}

final class LoginInitial extends LoginState {}

final class LoginLoading extends LoginState {}

final class LoginSuccess extends LoginState {
  final UserModel userModal;

  LoginSuccess({required this.userModal});
}

final class LoginFailure extends LoginState {
  final String errMasagge;

  LoginFailure({required this.errMasagge});
}

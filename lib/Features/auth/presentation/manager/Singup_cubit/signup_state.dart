part of 'signup_cubit.dart';

@immutable
sealed class SignupState {}

final class SignupInitial extends SignupState {}

final class SignupLoading extends SignupState {}

final class SignupSuccess extends SignupState {
  final UserModel userModel;

  SignupSuccess({required this.userModel});
}

final class SignupFailure extends SignupState {
  final String errMassage;

  SignupFailure({required this.errMassage});
}

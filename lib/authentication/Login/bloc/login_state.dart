part of 'login_bloc.dart';

@immutable
abstract class LoginState {}

class LoginInitial extends LoginState {}

class LoginLoading extends LoginState {}

class LoginSuccess extends LoginState {}

class Logout extends LoginState {}

class LoginFailure extends LoginState {
  final String error;

  LoginFailure(this.error);
}

class LoginFormState extends LoginState {
  final bool isAccountValid;
  final bool isPasswordValid;

  bool get isFormValid => isAccountValid && isPasswordValid;

  LoginFormState({
    required this.isAccountValid,
    required this.isPasswordValid,
  });
}

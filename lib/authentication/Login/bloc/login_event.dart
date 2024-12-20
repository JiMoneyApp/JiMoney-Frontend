part of 'login_bloc.dart';

@immutable
sealed class LoginEvent {}

class LogoutEvent extends LoginEvent {}

class LoginButtonPressed extends LoginEvent {
  final String username;
  final String password;

  LoginButtonPressed({required this.username, required this.password});
}

class AccountChanged extends LoginEvent {
  final String username;

  AccountChanged({required this.username});
}

class LPasswordChanged extends LoginEvent {
  final String password;

  LPasswordChanged({required this.password});
}

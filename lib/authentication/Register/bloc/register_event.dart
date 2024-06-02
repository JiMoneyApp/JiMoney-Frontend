part of 'register_bloc.dart';

@immutable
abstract class RegisterEvent {}

class UsernameChanged extends RegisterEvent {
  final String username;

  UsernameChanged({required this.username});
}

class NicknameChanged extends RegisterEvent {
  final String nickname;

  NicknameChanged({required this.nickname});
}

class PasswordChanged extends RegisterEvent {
  final String password;

  PasswordChanged({required this.password});
}

class ConfirmPasswordChanged extends RegisterEvent {
  final String confirmPassword;

  ConfirmPasswordChanged({required this.confirmPassword});
}

class RegisterButtonPressed extends RegisterEvent {
  final String username;
  final String nickname;
  final String password;
  final String confirmPassword;

  RegisterButtonPressed({
    required this.username,
    required this.nickname,
    required this.password,
    required this.confirmPassword,
  });
}

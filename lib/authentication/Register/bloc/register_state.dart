part of 'register_bloc.dart';

@immutable
abstract class RegisterState {}

class RegisterInitial extends RegisterState {}

class RegisterLoading extends RegisterState {}

class RegisterSuccess extends RegisterState {
  final String message;
  final UserInfo userInfo;

  RegisterSuccess(this.message, this.userInfo);
  // RegisterSuccess.successWithUserInfo(this.userInfo) : message = "Registration successful!";
}

class RegisterFailure extends RegisterState {
  final String error;

  RegisterFailure(this.error);
}

class RegisterFormState extends RegisterState {
  final bool isAccountValid;
  final bool isNicknameValid;
  final bool isPasswordValid;
  final bool isConfirmPasswordValid;
  bool get isRFormValid =>
      isAccountValid &&
      isNicknameValid &&
      isPasswordValid &&
      isConfirmPasswordValid;
  RegisterFormState({
    required this.isAccountValid,
    required this.isNicknameValid,
    required this.isPasswordValid,
    required this.isConfirmPasswordValid,
  });
}

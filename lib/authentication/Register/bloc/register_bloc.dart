import 'package:bloc/bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:jimoney_frontend/feature/common/user_info.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  final UserInfo userInfo = GetIt.instance<UserInfo>();
  RegisterBloc()
      : super(RegisterFormState(
            isAccountValid: true,
            isNicknameValid: true,
            isPasswordValid: true,
            isConfirmPasswordValid: true)) {
    on<RegisterButtonPressed>(_onRegisterButtonPressed);
    on<UsernameChanged>(_onUsernameChanged);
    on<NicknameChanged>(_onNicknameChanged);
    on<PasswordChanged>(_onPasswordChanged);
    on<ConfirmPasswordChanged>(_onConfirmPasswordChanged);
  }

  Future<void> _onRegisterButtonPressed(
    RegisterButtonPressed event,
    Emitter<RegisterState> emit,
  ) async {
    emit(RegisterLoading());
    if (event.password != event.confirmPassword) {
      emit(RegisterFailure("Passwords do not match"));
      emit(RegisterFormState(
        isAccountValid: _isValidUsername(event.username),
        isNicknameValid: _isValidNickname(event.nickname),
        isPasswordValid: _isValidPassword(event.password),
        isConfirmPasswordValid:
            _isValidConfirmPassword(event.password, event.confirmPassword),
      ));
      return;
    }

    try {
      bool isRegistered = await _registerUser(
        event.username,
        event.nickname,
        event.password,
        event.confirmPassword,
      );

      if (isRegistered) {
        userInfo.username = event.username;
        userInfo.password = event.password;
        userInfo.nickname = event.nickname;
        userInfo.budget = 0;
        userInfo.isdark = false;
        userInfo.noticetime = "";
        emit(RegisterSuccess("Registration successful!"));
      } else {
        emit(RegisterFailure("Registration failed"));
        emit(RegisterFormState(
          isAccountValid: _isValidUsername(event.username),
          isNicknameValid: _isValidNickname(event.nickname),
          isPasswordValid: _isValidPassword(event.password),
          isConfirmPasswordValid:
              _isValidConfirmPassword(event.password, event.confirmPassword),
        ));
      }
    } catch (e) {
      emit(RegisterFailure("An error occurred"));
      emit(RegisterFormState(
        isAccountValid: _isValidUsername(event.username),
        isNicknameValid: _isValidNickname(event.nickname),
        isPasswordValid: _isValidPassword(event.password),
        isConfirmPasswordValid:
            _isValidConfirmPassword(event.password, event.confirmPassword),
      ));
    }
  }

  void _onUsernameChanged(UsernameChanged event, Emitter<RegisterState> emit) {
    final currentState = state;
    if (currentState is RegisterFormState) {
      emit(RegisterFormState(
        isAccountValid: _isValidUsername(event.username),
        isNicknameValid: currentState.isNicknameValid,
        isPasswordValid: currentState.isPasswordValid,
        isConfirmPasswordValid: currentState.isConfirmPasswordValid,
      ));
    }
  }

  void _onNicknameChanged(NicknameChanged event, Emitter<RegisterState> emit) {
    final currentState = state;
    if (currentState is RegisterFormState) {
      emit(RegisterFormState(
        isAccountValid: currentState.isAccountValid,
        isNicknameValid: _isValidNickname(event.nickname),
        isPasswordValid: currentState.isPasswordValid,
        isConfirmPasswordValid: currentState.isConfirmPasswordValid,
      ));
    }
  }

  void _onPasswordChanged(PasswordChanged event, Emitter<RegisterState> emit) {
    final currentState = state;
    if (currentState is RegisterFormState) {
      emit(RegisterFormState(
          isAccountValid: currentState.isAccountValid,
          isNicknameValid: currentState.isNicknameValid,
          isPasswordValid: _isValidPassword(event.password),
          isConfirmPasswordValid: currentState.isConfirmPasswordValid));
    }
  }

  void _onConfirmPasswordChanged(
      ConfirmPasswordChanged event, Emitter<RegisterState> emit) {
    final currentState = state;
    if (currentState is RegisterFormState) {
      emit(RegisterFormState(
        isAccountValid: currentState.isAccountValid,
        isNicknameValid: currentState.isNicknameValid,
        isPasswordValid: currentState.isPasswordValid,
        isConfirmPasswordValid: _isValidConfirmPassword(
            event.confirmPassword, event.confirmPassword),
      ));
    }
  }

  bool _isValidUsername(String username) {
    return username.isNotEmpty;
  }

  bool _isValidNickname(String nickname) {
    return nickname.isNotEmpty;
  }

  bool _isValidPassword(String password) {
    return password.length >= 6;
  }

  bool _isValidConfirmPassword(String password, String confirmPassword) {
    return confirmPassword.length >= 6 && confirmPassword == password;
  }

  Future<bool> _registerUser(
    String username,
    String nickname,
    String password,
    String confirmPassword,
  ) async {
    // Construct the API URL
    // final baseUrl =
    //     Uri.https('54.179.125.22:5000', '/user/insert_acc_password');
    final baseUrl = 'http://54.179.125.22:5000/user/insert_acc_password';
    final String apiUrl =
        '$baseUrl?user_acc=$username&user_name=$nickname&user_password=$password';
    // Send POST request to register user
    final response = await http.post(
      Uri.parse(apiUrl),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'UName': username,
        'UPassword': password,
        'UNickname': nickname,
        // 'UConfirmPassword': confirmPassword,
      }),
    );
    // Check if the response is successful
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }
}

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc()
      : super(LoginFormState(isAccountValid: true, isPasswordValid: true)) {
    on<LoginButtonPressed>(_onLoginButtonPressed);
    on<AccountChanged>(_onAccountChanged);
    on<LPasswordChanged>(_onPasswordChanged);
  }

  Future<void> _onLoginButtonPressed(
    LoginButtonPressed event,
    Emitter<LoginState> emit,
  ) async {
    emit(LoginLoading());

    try {
      bool isLoggedIn = await _authenticateUser(event.username, event.password);

      if (isLoggedIn) {
        emit(LoginSuccess());
      } else {
        emit(LoginFailure('Invalid username or password'));
        emit(LoginFormState(
            isAccountValid: _isValidAccount(event.username),
            isPasswordValid: _isValidPassword(event.password)));
      }
    } catch (e) {
      emit(LoginFailure('An error occurred'));
      emit(LoginFormState(
          isAccountValid: _isValidAccount(event.username),
          isPasswordValid: _isValidPassword(event.password)));
    }
  }

  void _onAccountChanged(AccountChanged event, Emitter<LoginState> emit) {
    final currentState = state;
    if (currentState is LoginFormState) {
      emit(LoginFormState(
        isAccountValid: _isValidAccount(event.username),
        isPasswordValid: currentState.isPasswordValid,
      ));
    }
  }

  void _onPasswordChanged(LPasswordChanged event, Emitter<LoginState> emit) {
    final currentState = state;
    if (currentState is LoginFormState) {
      emit(LoginFormState(
        isAccountValid: currentState.isAccountValid,
        isPasswordValid: _isValidPassword(event.password),
      ));
    }
  }

  Future<bool> _authenticateUser(String username, String password) async {
    final String baseUrl = 'http://54.179.125.22:5000/user/get_user_id';
    final String apiUrl = '$baseUrl?user_acc=$username&user_password=$password';

    final response = await http.post(
      Uri.parse(apiUrl),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'UName': username,
        'UPassword': password,
      }),
    );

    if (response.statusCode == 200) {
      final responseData = jsonDecode(response.body);
      return responseData != null;
    } else {
      return false;
    }
  }

  bool _isValidAccount(String username) {
    // Add your account validation logic here
    return username.isNotEmpty;
  }

  bool _isValidPassword(String password) {
    // Add your password validation logic here
    return password.length >= 6;
  }
}

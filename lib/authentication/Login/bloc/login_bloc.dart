import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jimoney_frontend/ApiServices/fetchuser.dart';
import 'package:jimoney_frontend/feature/common/user_info.dart';
import 'package:jimoney_frontend/routing/bloc/bottom_navigation_bloc.dart';
import 'package:meta/meta.dart';
import 'package:get_it/get_it.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final UserService userService = GetIt.instance<UserService>();
  final UserInfo userInfo = GetIt.instance<UserInfo>();

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
      final int? userId =
          await userService.fetchUserId(event.username, event.password);
      if (userId != null) {
        final nickname = await userService.fetchUserNickname(userId);
        final budget = await userService.fetchUserBudget(userId);
        final noticetime = await userService.fetchUserNoticeTime(userId);
        // final righthanded =
        //     await userService.fetchUserRightHandedStatus(userId);
        userInfo.username = event.username;
        userInfo.nickname = nickname!;
        userInfo.password = event.password;
        userInfo.rightHanded = true;
        userInfo.budget = budget!;
        userInfo.noticetime = noticetime!;
        // Optionally, store the userInfo in GetIt or another service
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

  bool _isValidAccount(String username) {
    // Add your account validation logic here
    return username.isNotEmpty;
  }

  bool _isValidPassword(String password) {
    // Add your password validation logic here
    return password.length >= 6;
  }
}

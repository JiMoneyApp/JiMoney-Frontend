import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:jimoney_frontend/authentication/Login/bloc/login_bloc.dart';
import 'package:jimoney_frontend/feature/AfterLogin/presentation/analytics_page.dart';
import 'package:jimoney_frontend/feature/AfterLogin/presentation/home_page.dart';
import 'package:jimoney_frontend/feature/AfterLogin/presentation/settings_page.dart';
import 'package:jimoney_frontend/authentication/Login/presentation/login_afterlogoutpage.dart';
import 'package:jimoney_frontend/authentication/presentation/login_page.dart';
import 'package:jimoney_frontend/authentication/Register/presentation/register_page.dart';
import 'package:jimoney_frontend/routing/bloc/bottom_navigation_bloc.dart';

final GoRouter authroutes = GoRouter(
  initialLocation: LoginAfterLogoutPage.path,
  routes: [
    GoRoute(
      path: LoginAfterLogoutPage.path,
      builder: (cxt, __) => const LoginAfterLogoutPage(),
      // builder: (_, __) => BlocListener<LoginBloc, LoginState>(
      //   listener: (context, state) {
      //     if (state is LoginSuccess) {
      //       context.go(HomePage.path);
      //     }
      //   },
      //   child: LoginAfterLogoutPage(),
      // ),
    ),
    GoRoute(
      path: LoginPage.path,
      builder: (cxt, __) => const LoginPage(),
      // builder: (cxt, _) => BlocListener<LoginBloc, LoginState>(
      //   listener: (context, state) {
      //     if (state is LoginSuccess) {
      //       context.go(HomePage.path);
      //     }
      //     // Handle login state changes here if needed
      //   },
      //   child: const LoginPage(),
      // ),
    ),
    GoRoute(
      path: RegisterPage.path,
      builder: (cxt, __) => const RegisterPage(),
    ),
    GoRoute(
      path: HomePage.path,
      builder: (cxt, __) => const HomePage(),
      // builder: (cxt, __) =>
      //     BlocListener<BottomNavigationBloc, BottomNavigationState>(
      //   listener: (context, state) {
      //     if (state is HomeScreenState) {
      //       context.go(HomePage.path);
      //     }
      //   },
      //   child: const HomePage(),
    ),
    GoRoute(
      path: AnalyticsPage.path,
      builder: (cxt, __) => const AnalyticsPage(),
      // builder: (cxt, __) =>
      //     BlocListener<BottomNavigationBloc, BottomNavigationState>(
      //   listener: (context, state) {
      //     if (state is AnalyticsScreenState) {
      //       context.go(AnalyticsPage.path);
      //     }
      //   },
      //   child: const AnalyticsPage(),
      // ),
    ),
    GoRoute(
      path: SettingsPage.path,
      builder: (cxt, __) => const SettingsPage(),
      // builder: (cxt, __) =>
      //     BlocListener<BottomNavigationBloc, BottomNavigationState>(
      //   listener: (context, state) {
      //     if (state is SettingsScreenState) {
      //       context.go(SettingsPage.path);
      //     }
      //   },
      //   child: const SettingsPage(),
      // ),
    ),
  ],
);

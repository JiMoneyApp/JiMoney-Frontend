import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:jimoney_frontend/authentication/AfterLogin/main_presentation.dart';
import 'package:jimoney_frontend/authentication/Login/bloc/login_bloc.dart';
import 'package:jimoney_frontend/feature/AfterLogin/presentation/home_page.dart';
import 'package:jimoney_frontend/feature/AfterLogin/presentation/settings_page.dart';
import 'package:jimoney_frontend/authentication/Login/presentation/login_afterlogoutpage.dart';
import 'package:jimoney_frontend/authentication/presentation/login_page.dart';
import 'package:jimoney_frontend/authentication/Register/presentation/register_page.dart';

import 'bloc/bottom_navigation_bloc.dart';

final GoRouter authroutes = GoRouter(
  initialLocation: LoginAfterLogoutPage.path,
  routes: [
    GoRoute(
      path: LoginAfterLogoutPage.path,
      builder: (cxt, state) => const LoginAfterLogoutPage(),
    ),
    GoRoute(
      path: LoginPage.path,
      builder: (cxt, __) => const LoginPage(),
    ),
    GoRoute(
      path: RegisterPage.path,
      builder: (cxt, __) => const RegisterPage(),
    ),
    GoRoute(
      path: MainPage.path,
      builder: (cxt, state) => const MainPage(),
    )
    // GoRoute(
    //   path: HomePage.path,
    //   builder: (cxt, __) => const HomePage(),
    // ),
    // GoRoute(
    //   path: AnalyticsPage.path,
    //   builder: (cxt, __) => const AnalyticsPage(),
    // ),
    // GoRoute(
    //   path: SettingsPage.path,
    //   builder: (cxt, __) => const SettingsPage(),
    // ),
  ],
);

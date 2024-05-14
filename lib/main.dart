import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:jimoney_frontend/common_widgets/BottomNavigation/bloc/bottom_navigation_bloc.dart';
import 'package:jimoney_frontend/features/AfterLogin/presentation/analytics_page.dart';
import 'package:jimoney_frontend/features/Analysis/presentation/statistics.dart';
import 'package:jimoney_frontend/features/Home/presentation/home_page.dart';
import 'package:jimoney_frontend/features/Login/presentation/login_afterlogoutpage.dart';
import 'package:jimoney_frontend/features/Register/presentation/login_page.dart';
import 'package:jimoney_frontend/features/Register/presentation/register_page.dart';
import 'package:jimoney_frontend/features/Settings/presentation/settings_page.dart';
import 'package:jimoney_frontend/lifecycle/app_lifecycle.dart';
import 'package:jimoney_frontend/routing/auth_routes.dart';

import 'package:jimoney_frontend/routing/auth_routes.dart'; // import this

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
        routeInformationParser:
            authroutes.routeInformationParser, // use authroutes here
        routerDelegate: authroutes.routerDelegate, // and here
        builder: (context, child) {
          return BlocProvider(
              create: (context) => BottomNavigationBloc(),
              child: BlocBuilder<BottomNavigationBloc, BottomNavigationState>(
                  builder: (context, state) {
                if (state is HomeScreenState) {
                  return HomePage();
                } else if (state is StatisticsScreenState) {
                  return StatisticsPage();
                } else if (state is SettingsScreenState) {
                  return SettingsPage();
                } else {
                  return LoginPage();
                }
              }));
        });
  }
}

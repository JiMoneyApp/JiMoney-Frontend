import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jimoney_frontend/authentication/Login/bloc/login_bloc.dart';
import 'package:jimoney_frontend/authentication/presentation/login_page.dart';
import 'package:jimoney_frontend/feature/AfterLogin/presentation/analytics_page.dart';
import 'package:jimoney_frontend/feature/AfterLogin/presentation/home_page.dart';
import 'package:jimoney_frontend/feature/AfterLogin/presentation/settings_page.dart';
import 'package:jimoney_frontend/locator.dart';
import 'package:jimoney_frontend/routing/auth_routes.dart';
import 'package:jimoney_frontend/routing/bloc/bottom_navigation_bloc.dart';

void main() {
  setupLocator();
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // return MaterialApp.router(
    //       debugShowCheckedModeBanner: false, routerConfig: authroutes
    // );
    return MaterialApp.router(
        routeInformationParser:
            authroutes.routeInformationParser, // use authroutes here
        routerDelegate: authroutes.routerDelegate, // and here
        builder: (context, child) {
          return MultiBlocProvider(
            providers: [
              BlocProvider<BottomNavigationBloc>(
                create: (context) => BottomNavigationBloc(),
              ),
            ],
            child: BlocBuilder<BottomNavigationBloc, BottomNavigationState>(
              builder: (context, state) {
                if (state is HomeScreenState) {
                  return HomePage();
                } else if (state is AnalyticsScreenState) {
                  return AnalyticsPage();
                } else if (state is SettingsScreenState) {
                  return SettingsPage();
                } else {
                  return LoginPage();
                }
              },
            ),
          );
        });
  }
}

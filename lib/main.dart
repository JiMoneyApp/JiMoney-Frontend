import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:jimoney_frontend/authentication/Login/bloc/login_bloc.dart';
import 'package:jimoney_frontend/authentication/presentation/login_page.dart';
import 'package:jimoney_frontend/feature/AfterLogin/presentation/analytics_page.dart';
import 'package:jimoney_frontend/feature/AfterLogin/presentation/home_page.dart';
import 'package:jimoney_frontend/feature/AfterLogin/presentation/settings_page.dart';
import 'package:jimoney_frontend/locator.dart';
import 'package:jimoney_frontend/routing/auth_routes.dart';
import 'package:jimoney_frontend/routing/bloc/bottom_navigation_bloc.dart';
import 'package:provider/provider.dart';

void main() {
  setupLocator();
  runApp(App());
}

class App extends StatelessWidget {
  const App({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<LoginBloc>(
          create: (context) => LoginBloc(),
        ),
        BlocProvider<BottomNavigationBloc>(
          create: (context) => BottomNavigationBloc(),
        ),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        routerConfig: authroutes,
        // routerDelegate: authroutes.routerDelegate,
        // routeInformationParser: authroutes.routeInformationParser,
        builder: (context, child) {
          return MultiBlocListener(listeners: [
            BlocListener<LoginBloc, LoginState>(
              listener: (context, state) {
                if (state is LoginSuccess) {
                  context
                      .read<BottomNavigationBloc>()
                      .add(NavigateToHomeEvent());
                  context.go(HomePage.path);
                }
              },
            ),
            BlocListener<BottomNavigationBloc, BottomNavigationState>(
              listener: (context, state) {
                if (state is HomeScreenState) {
                  print("goH");
                  authroutes.pushReplacement(HomePage.path);
                  //GoRouter.of(context).go(HomePage.path);
                } else if (state is AnalyticsScreenState) {
                  print("goA");
                  authroutes.pushReplacement(AnalyticsPage.path);
                  //GoRouter.of(context)..go(AnalyticsPage.path);
                } else if (state is SettingsScreenState) {
                  print("goS");
                  authroutes.pushReplacement(SettingsPage.path);
                  //GoRouter.of(context).go(SettingsPage.path);
                }
              },
            ),
          ], child: child!);
        },
      ),
    );
  }
}

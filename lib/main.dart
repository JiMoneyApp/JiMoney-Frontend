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
import 'package:jimoney_frontend/routing/bottomNavigationBar.dart';
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
      ),
    );
  }
}

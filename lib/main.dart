import 'package:flutter/material.dart';
import 'package:jimoney_frontend/AfterLogin/presentation/analytics_page.dart';
import 'package:jimoney_frontend/AfterLogin/presentation/home_page.dart';
import 'package:jimoney_frontend/Login/presentation/login_afterlogoutpage.dart';
import 'package:jimoney_frontend/Register/presentation/login_page.dart';
import 'package:jimoney_frontend/Register/presentation/register_page.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
      initialRoute: '/',
      routes: {
        '/login':(context) => const LoginPage(),
        '/register':(context) => const RegisterPage(),
        '/home': (context) => const HomePage(),
        '/analytics': (context) => const AnalyticsPage(),
  },
    );
  }
}

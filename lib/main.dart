import 'package:flutter/material.dart';
import 'package:jimoney_frontend/Login/presentation/login_afterlogoutpage.dart';
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
      home: RegisterPage(),
    );
  }
}

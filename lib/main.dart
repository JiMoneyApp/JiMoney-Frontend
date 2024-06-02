import 'package:flutter/material.dart';
import 'package:jimoney_frontend/routing/auth_routes.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
        debugShowCheckedModeBanner: false, routerConfig: authroutes);
  }
}

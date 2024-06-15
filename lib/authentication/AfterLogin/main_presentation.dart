import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jimoney_frontend/feature/AfterLogin/presentation/home_page.dart';
import 'package:jimoney_frontend/feature/AfterLogin/presentation/analytics_page.dart';
import 'package:jimoney_frontend/feature/AfterLogin/presentation/settings_page.dart';
import 'package:jimoney_frontend/routing/bloc/bottom_navigation_bloc.dart';
import 'package:jimoney_frontend/routing/bottomNavigationBar.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});
  static String path = "/mainpage";
  @override
  State<MainPage> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<BottomNavigationBloc, BottomNavigationState>(
        builder: (context, state) {
          if (state is HomeScreenState) {
            return HomePage();
          } else if (state is AnalyticsScreenState) {
            return AnalyticsPage();
          } else if (state is SettingsScreenState) {
            return SettingsPage();
          } else {
            return HomePage();
          }
        },
      ),
      bottomNavigationBar: BottomNavigation(),
    );
  }
}

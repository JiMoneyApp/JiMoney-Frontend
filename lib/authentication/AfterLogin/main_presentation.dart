import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jimoney_frontend/authentication/presentation/login_page.dart';
import 'package:jimoney_frontend/feature/AfterLogin/presentation/home_page.dart';
import 'package:jimoney_frontend/feature/AfterLogin/presentation/settings_page.dart';
import 'package:jimoney_frontend/feature/bloc/bloc/data_bloc.dart';
import 'package:jimoney_frontend/feature/bloc/ledger_bloc.dart';
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
      body: MultiBlocProvider(
        providers: [
          BlocProvider<LedgerBloc>(
            create: (context) => LedgerBloc(),
          ),
          BlocProvider<DataBloc>(
            create: (context) => DataBloc(),
          ),
        ],
        child: BlocBuilder<BottomNavigationBloc, BottomNavigationState>(
          builder: (context, state) {
            if (state is HomeScreenState) {
              return HomePage();
            } else if (state is SettingsScreenState) {
              return SettingsPage();
            } else {
              return LoginPage();
              // return HomePage();
            }
          },
        ),
      ),
      bottomNavigationBar: BottomNavigation(),
    );
  }
}

import 'package:go_router/go_router.dart';
import 'package:jimoney_frontend/features/Analysis/presentation/statistics.dart';
import 'package:jimoney_frontend/features/Home/presentation/home_page.dart';
import 'package:jimoney_frontend/features/Login/presentation/login_afterlogoutpage.dart';
import 'package:jimoney_frontend/features/Register/presentation/login_page.dart';
import 'package:jimoney_frontend/features/Register/presentation/register_page.dart';
import 'package:jimoney_frontend/features/Settings/presentation/settings_page.dart';

final authroutes =
    GoRouter(initialLocation: LoginAfterLogoutPage.path, routes: [
  GoRoute(
      path: LoginAfterLogoutPage.path, // LoginAfterLogoutPage 的 PopUpDrawer
      builder: (_, __) => LoginAfterLogoutPage()),
  GoRoute(path: LoginPage.path, builder: (cxt, _) => const LoginPage()),
  GoRoute(path: RegisterPage.path, builder: (cxt, __) => const RegisterPage()),
  GoRoute(path: HomePage.path, builder: (cxt, __) => const HomePage()),
  GoRoute(path: SettingsPage.path, builder: (cxt, __) => const SettingsPage()),
  GoRoute(
      path: StatisticsPage.path, builder: (cxt, __) => const StatisticsPage()),
  // PopUpDrawer
]);

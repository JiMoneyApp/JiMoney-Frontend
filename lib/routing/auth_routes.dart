import 'package:go_router/go_router.dart';
import 'package:jimoney_frontend/authentication/AfterLogin/budget_page.dart';
import 'package:jimoney_frontend/feature/AfterLogin/presentation/analytics_page.dart';
import 'package:jimoney_frontend/feature/AfterLogin/presentation/home_page.dart';
import 'package:jimoney_frontend/feature/AfterLogin/presentation/settings_page.dart';
import 'package:jimoney_frontend/authentication/Login/presentation/login_afterlogoutpage.dart';
import 'package:jimoney_frontend/authentication/Login/widget/pop_up_drawer.dart';
import 'package:jimoney_frontend/authentication/presentation/login_page.dart';
import 'package:jimoney_frontend/authentication/Register/presentation/register_page.dart';
import 'package:jimoney_frontend/feature/AfterLogin/presentation/newbie_budget_page.dart';

final authroutes =
    GoRouter(initialLocation: LoginAfterLogoutPage.path, routes: [
  GoRoute(
      path: LoginAfterLogoutPage.path, // LoginAfterLogoutPage 的 PopUpDrawer
      builder: (_, __) => LoginAfterLogoutPage()),
  GoRoute(path: LoginPage.path, builder: (cxt, _) => const LoginPage()),
  GoRoute(path: RegisterPage.path, builder: (cxt, __) => const RegisterPage()),
  GoRoute(
      path: HomePage.path,
      builder: (cxt, __) => const HomePage()), // PopUpDrawer
  GoRoute(
      path: AnalyticsPage.path, builder: (cxt, __) => const AnalyticsPage()),
  GoRoute(
    path: SettingsPage.path,
    builder: (cxt, __) => const SettingsPage(),
  ),
  GoRoute(path: NewbieBudgetPage.path, builder: (cxt, __) => const NewbieBudgetPage()),
]);

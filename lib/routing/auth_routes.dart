import 'package:go_router/go_router.dart';
import 'package:jimoney_frontend/Login/presentation/login_afterlogoutpage.dart';
import 'package:jimoney_frontend/Login/widget/pop_up_drawer.dart';
import 'package:jimoney_frontend/Register/presentation/login_page.dart';
import 'package:jimoney_frontend/Register/presentation/register_page.dart';

final authroutes =
    GoRouter(initialLocation: LoginAfterLogoutPage.path, routes: [
  GoRoute(
      path: LoginAfterLogoutPage.path, // LoginAfterLogoutPage 的 PopUpDrawer
      builder: (_, __) => LoginAfterLogoutPage()),
  GoRoute(path: LoginPage.path, builder: (cxt, _) => const LoginPage()),
  GoRoute(path: RegisterPage.path, builder: (cxt, __) => const RegisterPage()),
]);

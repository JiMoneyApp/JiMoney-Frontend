import 'package:flutter/material.dart';
import 'package:jimoney_frontend/Login/widget/pop_up_drawer.dart';

class LoginAfterLogoutPage extends StatefulWidget {
  const LoginAfterLogoutPage({super.key});

  @override
  State<LoginAfterLogoutPage> createState() => _LoginAfterLogoutPageState();
}

class _LoginAfterLogoutPageState extends State<LoginAfterLogoutPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.maxFinite,
      child: Scaffold(
        body: Stack(
            alignment: AlignmentDirectional.bottomCenter,
            children: <Widget>[
              Container(
                height: double.infinity,
                child: Text(''),
              ),
              AnimatedContainer(
                height: 300,
                width: double.infinity,
                duration: Duration(seconds: 2),
                child: PopUpDrawer(),
              ),
            ]),
      ),
    );
  }
}

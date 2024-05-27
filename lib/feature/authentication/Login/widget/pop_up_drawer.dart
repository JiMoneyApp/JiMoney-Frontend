import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:jimoney_frontend/feature/authentication/presentation/login_page.dart';
import 'package:jimoney_frontend/feature/authentication/Register/presentation/register_page.dart';

class PopUpDrawer extends StatelessWidget {
  PopUpDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      decoration: BoxDecoration(
        color: const Color(0xFF559BCF),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(60),
          topRight: Radius.circular(60),
        ),
      ),
      child: Column(
        children: [
          SizedBox(height: 50),
          ElevatedButton(
            onPressed: () {
              context.push("/register");
            },
            child: Text(
              'Register',
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
            style: ElevatedButton.styleFrom(
              minimumSize: Size(280, 45),
              backgroundColor: Color(0XFF0D176C),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
          SizedBox(height: 25),
          ElevatedButton(
            onPressed: () async {
              context.push("/login");
            },
            child: Text(
              'Already have account?',
              style: TextStyle(color: Colors.black, fontSize: 16),
            ),
            style: ElevatedButton.styleFrom(
              minimumSize: Size(280, 45),
              backgroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
          SizedBox(height: 25),
          Divider(color: Colors.white),
        ],
      ),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFF559BCF),
      child: Column(
        children: [
          Container(
            height: 510,
            width: 350,
            alignment: Alignment.bottomCenter,
            child: Material(
              borderRadius: BorderRadius.circular(10),
              child: TextField(
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                  hintText: "Username"
                ),
              ),
            ),
          ),
          Container(
            height: 100,
            width: 350,
            alignment: Alignment.bottomCenter,
            child: Material(
              borderRadius: BorderRadius.circular(10),
              child: TextField(
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                  hintText: "Password",
                ),
              ),
            ),
          ),
          Container(
            height: 80,
            width: 350,
            alignment: Alignment.topLeft,
            padding: EdgeInsets.fromLTRB(0, 12, 0, 0),
            child: Text(
              "Forget password?",
              style: TextStyle(
                decoration: TextDecoration.none,
                fontSize: 13,
                color: Colors.black
              ),
            )
          ),
          ElevatedButton(
            onPressed: (){},
            child: Text(
              "Login",
              style: TextStyle(color: Colors.black, fontSize: 16),
            ),
            style: ElevatedButton.styleFrom(
              minimumSize: Size(350, 50),
              backgroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10)
              ),
              shadowColor: Colors.black,
            ),
          ),
          Divider(
            height: 100,
            color: Colors.white,
          ),
          Row(
            children: [
              Container(
                alignment: Alignment.topRight,
                height: 40,
                width: 220,
                child: Text(
                  "Don't have an account?",
                  style: TextStyle(
                    decoration: TextDecoration.none,
                    fontSize: 13,
                    color: Colors.black,
                  ),
                ),
              ),
              Container(
                height: 40,
                width: 200,
                padding: EdgeInsets.fromLTRB(35, 0, 0, 0),
                alignment: Alignment.topLeft,
                child: Text(
                  "Sign Up",
                  style: TextStyle(
                    decoration: TextDecoration.none,
                    fontSize: 13,
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFF559BCF),
      child: Column(
        children: [
          Container(
            height: 350,
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
            height: 90,
            width: 350,
            alignment: Alignment.bottomCenter,
            child: Material(
              borderRadius: BorderRadius.circular(10),
              child: TextField(
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                  hintText: "Nickname"
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:jimoney_frontend/Register/presentation/login_page.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.maxFinite,
      color: Color(0xFF559BCF),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.fromLTRB(70, 30, 0, 0),
            height: 240,
            width: 350,
            child: Scaffold(
              body: Image(
                image: AssetImage('lib/assets/logo.png'),
              ),
              backgroundColor: Color(0xFF559BCF),
            ),
          ),
          // Username
          Container(
            height: 60,
            width: 350,
            alignment: Alignment.bottomCenter,
            child: Material(
              borderRadius: BorderRadius.circular(10),
              child: TextField(
                decoration: InputDecoration(
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                    hintText: "Username"),
              ),
            ),
          ),
          // Nickname
          Container(
            height: 90,
            width: 350,
            alignment: Alignment.bottomCenter,
            child: Material(
              borderRadius: BorderRadius.circular(10),
              child: TextField(
                decoration: InputDecoration(
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                    hintText: "Nickname"),
              ),
            ),
          ),
          Container(
              height: 30,
              width: 350,
              alignment: Alignment.topLeft,
              padding: EdgeInsets.fromLTRB(3, 12, 0, 0),
              child: Text(
                "顯示於Personal Page 日後可做更改",
                style: TextStyle(
                    decoration: TextDecoration.none,
                    fontSize: 13,
                    color: Colors.black),
              )),
          // Password
          Container(
            height: 130,
            width: 350,
            alignment: Alignment.bottomCenter,
            child: Material(
              borderRadius: BorderRadius.circular(10),
              child: TextField(
                decoration: InputDecoration(
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                    hintText: "Password"),
              ),
            ),
          ),
          // Confirm Password
          Container(
            height: 90,
            width: 350,
            alignment: Alignment.bottomCenter,
            child: Material(
              borderRadius: BorderRadius.circular(10),
              child: TextField(
                decoration: InputDecoration(
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                    hintText: "Confirm Password"),
              ),
            ),
          ),
          // Register Button
          Container(
            padding: EdgeInsets.fromLTRB(0, 30, 0, 0),
            child: ElevatedButton(
              onPressed: () {},
              child: Text(
                "Register",
                style: TextStyle(color: Colors.black, fontSize: 16),
              ),
              style: ElevatedButton.styleFrom(
                minimumSize: Size(350, 50),
                backgroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                shadowColor: Colors.black,
              ),
            ),
          ),
          Divider(
            height: 50,
            color: Colors.white,
          ),
          // bottom text
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextButton(
                onPressed: () {
                  // Add your logic here
                },
                child: Text(
                  "Already have an account?",
                  style: TextStyle(
                    decoration: TextDecoration.none,
                    fontSize: 13,
                    color: Colors.black,
                  ),
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (ctx) => LoginPage()));
                },
                child: Text(
                  "Sign In",
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

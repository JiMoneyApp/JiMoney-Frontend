import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:jimoney_frontend/Register/presentation/register_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  static String path = "/login";

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
            padding: EdgeInsets.fromLTRB(20, 50, 0, 0),
            height: 370,
            width: 350,
            child: Scaffold(
              body: Image(
                image: AssetImage('lib/assets/logo.png'),
              ),
              backgroundColor: Color(0xFF559BCF),
            ),
          ),
          _usernameField(),
          _passwordField(),
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
                    color: Colors.red.shade100),
              )),
          ElevatedButton(
            onPressed: () {},
            child: Text(
              "Login",
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
          Divider(
            height: 100,
            color: Colors.white,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Don't have an account?",
                style: TextStyle(
                  decoration: TextDecoration.none,
                  fontSize: 16,
                  color: Colors.grey.shade300,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 4.0),
                child: TextButton(
                  onPressed: () async {
                    context.push("/register");
                  },
                  child: Text(
                    "Sign Up",
                    style: TextStyle(
                      decoration: TextDecoration.none,
                      fontSize: 16,
                      color: Colors.white,
                    ),
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

Widget _usernameField() {
  return Container(
    height: 100,
    width: 350,
    alignment: Alignment.bottomCenter,
    child: Material(
      borderRadius: BorderRadius.circular(10),
      child: TextField(
        autofillHints: const [AutofillHints.password],
        keyboardType: TextInputType.text,
        cursorColor: Colors.blue,
        //onChanged: () {}, // 將password存入
        onEditingComplete: () {
          debugPrint("password edit completed!");
          TextInput.finishAutofillContext();
        },
        // obscureText: !state
        decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: Colors.blue, width: 4.0)),
          contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          hintText: "Username",
          hintStyle: TextStyle(fontSize: 14),
        ),
      ),
    ),
  );
}

Widget _passwordField() {
  return Container(
    height: 100,
    width: 350,
    alignment: Alignment.bottomCenter,
    child: Material(
      borderRadius: BorderRadius.circular(10),
      child: TextField(
        autofillHints: const [AutofillHints.password],
        keyboardType: TextInputType.text,
        cursorColor: Colors.blue,
        //onChanged: () {}, // 將password存入
        onEditingComplete: () {
          debugPrint("password edit completed!");
          TextInput.finishAutofillContext();
        },
        obscureText: true,
        decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: Colors.blue, width: 4.0)),
          contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          hintText: "Password",
          hintStyle: TextStyle(fontSize: 14),
          suffixIcon: Padding(
            padding: EdgeInsets.only(right: 6),
            child: IconButton(
              iconSize: 18,
              onPressed: () {},
              icon: Icon(
                Icons.visibility_off,
              ),
            ),
          ),
        ),
      ),
    ),
  );
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'dart:convert';
import 'package:mysql_client/mysql_client.dart';
import 'package:http/http.dart' as http;
import 'package:jimoney_frontend/Register/presentation/register_page.dart';

int uid = 0;

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  static String path = "/login";
  

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _showErrorDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('錯誤'),
          content: Text('帳號或密碼錯誤'),
          actions: [
            TextButton(
              child: Text('確定'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Future<void> _login() async {
    final String baseUrl = 'http://54.179.125.22:5000/user/get_user_id';
    final String username = _usernameController.text;
    final String password = _passwordController.text;
    final String apiUrl = '$baseUrl?user_acc=$username&user_password=$password';
    print(_usernameController.text);
    print(_passwordController.text);
    final response = await http.post(
      Uri.parse(apiUrl),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'UName': _usernameController.text,
        'UPassword': _passwordController.text,
      }),
    );
    print(response.body);
    if (response.statusCode == 200) {
      final responseData = jsonDecode(response.body);
      uid = responseData[0];
      print('response data = $responseData');
      if (responseData != null) {
        print('Login success');
        context.push("/home");
      } 
      else {
        print('Login failed');
        _showErrorDialog(context);
      }
    } 
    else {
      print('Server error: ${response.statusCode}');
      // 处理服务器错误
    }
    print(response.statusCode);

  }

  

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
          _usernameField(_usernameController),
          _passwordField(_passwordController),
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
            onPressed: () {
              _login();
            },
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
            height: 60,
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



Widget _usernameField(final TextEditingController _usernameController) {
  return Container(
    height: 100,
    width: 350,
    alignment: Alignment.bottomCenter,
    child: Material(
      borderRadius: BorderRadius.circular(10),
      child: TextField(
        controller: _usernameController,
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

Widget _passwordField(final TextEditingController _passwordController) {
  return Container(
    height: 100,
    width: 350,
    alignment: Alignment.bottomCenter,
    child: Material(
      borderRadius: BorderRadius.circular(10),
      child: TextField(
        controller: _passwordController,
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
          hintText: "Password",
          hintStyle: TextStyle(fontSize: 14),
        ),
      ),
    ),
  );
}

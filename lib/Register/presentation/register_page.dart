import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:http/http.dart' as http;
import 'package:mysql_client/mysql_client.dart';
import 'dart:convert';
import 'package:jimoney_frontend/Register/presentation/login_page.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  static String path = "/register";

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {

  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _nicknameController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();

  @override
  Future<void> _register() async {
    
    final String baseUrl = 'http://54.179.125.22:5000/user/insert_acc_password';
    final String username = _usernameController.text;
    final String password = _passwordController.text;
    final String nickname = _nicknameController.text;
    final String confirmPassword = _confirmPasswordController.text;
    final String apiUrl = '$baseUrl?user_acc=$username&user_name=$nickname&user_password=$password';

    if(password != confirmPassword){
      print('Password and ConfirmPassword is not the same');
      return;
    }

    print(_usernameController.text);
    print(_passwordController.text);
    print(_nicknameController.text);
    print(_confirmPasswordController.text);

    final response = await http.post(
      Uri.parse(apiUrl),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'UName': _usernameController.text,
        'UPassword': _passwordController.text,
        'UNickname': _nicknameController.text,
        'UConfirmPassword': _confirmPasswordController.text,
      }),
    );


    
    print(response);
    if (response.statusCode == 200) {
      print("123456");
      if (response.body == 'success!') {  
        print('Register success');
        context.push("/login");
      }
        // 在这里可以处理登录成功后的逻辑，例如导航到另一个页面
      else {
        print('Register failed: ${response.body}');
        // 显示错误信息
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
                controller: _usernameController,
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
                controller: _nicknameController,
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
                controller: _passwordController,
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
                controller: _confirmPasswordController,
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
              onPressed: () {
                _register();
              },
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
              Text(
                "Already have an account?",
                style: TextStyle(
                  decoration: TextDecoration.none,
                  fontSize: 13,
                  color: Colors.black,
                ),
              ),
              TextButton(
                onPressed: () {
                  context.pop();
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

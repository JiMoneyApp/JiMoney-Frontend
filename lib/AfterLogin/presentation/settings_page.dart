import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:go_router/go_router.dart';
import 'package:jimoney_frontend/AfterLogin/widgets/head_sticker.dart';
import 'package:jimoney_frontend/Register/presentation/login_page.dart';
import 'package:jimoney_frontend/AfterLogin/widgets/time_notification.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  static String path = "/settings";

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  Future<String> _userAcc() async {
    final String baseUrl = 'http://54.179.125.22:5000/user';
    final int userid = uid;
    final String user_acc = '';
    final String getUserAcc_apiUrl =
        'http://54.179.125.22:5000/user/get_acc?user_id=$userid';

    final response = await http.post(
      Uri.parse(getUserAcc_apiUrl),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'UName': user_acc,
      }),
    );
    print(response.body);
    if (response.statusCode == 200) {
      final responseData = jsonDecode(response.body);
      print('response data = $responseData');
      return responseData[0];
    } else {
      print('Server error: ${response.statusCode}');
      return '';
      // 处理服务器错误
    }
  }

  Future<String> _userName() async {
    final String baseUrl = 'http://54.179.125.22:5000/user';
    final int userid = uid;
    final String user_name = '';
    final String getUserNickName_apiUrl =
        'http://54.179.125.22:5000/user/get_name?user_id=$userid';

    final response = await http.post(
      Uri.parse(getUserNickName_apiUrl),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'UName': user_name,
      }),
    );
    print(response.body);
    if (response.statusCode == 200) {
      final responseData = jsonDecode(response.body);
      print('response data = $responseData');
      return responseData[0];
    } else {
      print('Server error: ${response.statusCode}');
      return '';
      // 处理服务器错误
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.maxFinite,
      child: Scaffold(
        body: Column(
          children: [
            Container(
              padding: EdgeInsets.only(top: 70, left: 35, bottom: 20),
              alignment: Alignment.topLeft,
              child: Text(
                "Settings",
                style: TextStyle(fontSize: 20),
              ),
            ),
            Row(
              children: [
                Container(
                  width: 150,
                  padding: EdgeInsets.only(left: 35),
                  alignment: Alignment.center,
                  child: HeadSticker(),
                ),
                Container(
                    width: 230,
                    padding: EdgeInsets.only(left: 50),
                    alignment: Alignment.centerLeft,
                    child: Column(
                      children: [
                        Opacity(
                          opacity: 1,
                          child: FutureBuilder<String>(
                            future: _userName(),
                            builder: (BuildContext context,
                                AsyncSnapshot<String> snapshot) {
                              if (snapshot.connectionState ==
                                  ConnectionState.waiting) {
                                return CircularProgressIndicator();
                              } else if (snapshot.hasError) {
                                return Text('User', style: TextStyle(fontSize: 20));
                              } else {
                                return Text('${snapshot.data}', style: TextStyle(fontSize: 20));
                              }
                            },
                          ),
                        ),
                        Opacity(
                          opacity: 0.6,
                          child: FutureBuilder<String>(
                            future: _userAcc(),
                            builder: (BuildContext context,
                                AsyncSnapshot<String> snapshot) {
                              if (snapshot.connectionState ==
                                  ConnectionState.waiting) {
                                return CircularProgressIndicator();
                              } else if (snapshot.hasError) {
                                return Text('UserId');
                              } else {
                                return Text('@${snapshot.data}');
                              }
                            },
                          ),
                        ),
                      ],
                    )),
              ],
            ),
            // Daily Reminders
            Container(
              padding: EdgeInsets.only(top: 30),
              child: ElevatedButton(
                onPressed: () {
                  
                },
                child: Text("Daily Reminders",
                    style: TextStyle(fontSize: 20, color: Colors.black)),
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(320, 50),
                  backgroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  shadowColor: Colors.black,
                ),
              ),
            ),
            Container(
              height: 320,
              alignment: Alignment.bottomCenter,
              child: ElevatedButton(
                onPressed: () {},
                child: Text("About Us",
                    style: TextStyle(fontSize: 20, color: Colors.black)),
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(320, 50),
                  backgroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  shadowColor: Colors.black,
                ),
              ),
            ),
            Container(
              height: 90,
              alignment: Alignment.bottomCenter,
              child: ElevatedButton(
                onPressed: () {
                  uid = 0;
                  context.go("/login");
                },
                child: Text("Log Out",
                    style: TextStyle(fontSize: 20, color: Colors.black)),
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(320, 50),
                  backgroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  shadowColor: Colors.black,
                ),
              ),
            )
          ],
        ),
        bottomNavigationBar: BottomAppBar(
            child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              child: IconButton(
                  onPressed: () async {
                    context.go("/home");
                  },
                  icon: Icon(Icons.home)),
              width: 120,
            ),
            SizedBox(
              child: IconButton(
                  onPressed: () async {
                    context.go("/analytics");
                  },
                  icon: Icon(Icons.analytics)),
              width: 120,
            ),
            SizedBox(
                child: IconButton(onPressed: () {}, icon: Icon(Icons.settings)),
                width: 120),
          ],
        )),
      ),
    );
  }
}

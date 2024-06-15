import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:get_it/get_it.dart';
import 'package:jimoney_frontend/ApiServices/fetchuser.dart';
import 'package:jimoney_frontend/ApiServices/updateuser.dart';
import 'package:jimoney_frontend/feature/AfterLogin/widgets/head_sticker.dart';
import 'package:jimoney_frontend/feature/AfterLogin/widgets/logoutbutton.dart';
import 'package:jimoney_frontend/feature/common/user_info.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  final UserInfo userInfo = GetIt.instance<UserInfo>();
  final UserUpdateService userUpdateService =
      GetIt.instance<UserUpdateService>();
  int? userId = null;
  @override
  void initState() {
    super.initState();
    _fetchUserId();
  }

  Future<void> _fetchUserId() async {
    final UserService userService = GetIt.instance<UserService>();
    try {
      userId =
          await userService.fetchUserId(userInfo.username, userInfo.password);
      print(userId);
      // userId;
      // Now you can use the userId as needed
    } catch (e) {
      print("Error fetching user ID: $e");
      // return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.maxFinite,
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
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
                              child: Text(userInfo.nickname,
                                  style: TextStyle(
                                    fontSize: 20,
                                  ))),
                          Opacity(
                              opacity: 0.6,
                              child: Text("@" + userInfo.username)),
                        ],
                      )),
                ],
              ),
              // Daily Reminders
              // Daily Reminders
              Container(
                height: 70,
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: EdgeInsets.only(left: 35, right: 35),
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Row(
                      children: [
                        Icon(Icons.notifications, color: Colors.black),
                        SizedBox(width: 10),
                        Text("Daily Reminders",
                            style:
                                TextStyle(fontSize: 20, color: Colors.black)),
                      ],
                    ),
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(320, 50),
                      backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      shadowColor: Colors.black,
                    ),
                  ),
                ),
              ),
              // Change Budget
              Container(
                height: 70,
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: EdgeInsets.only(left: 35, right: 35),
                  child: ElevatedButton(
                    onPressed: () {
                      _showBudgetInputDialog(context);
                    },
                    child: Row(
                      children: [
                        Icon(Icons.money, color: Colors.black),
                        SizedBox(width: 10),
                        Text("Change Budget",
                            style:
                                TextStyle(fontSize: 20, color: Colors.black)),
                      ],
                    ),
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(320, 50),
                      backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      shadowColor: Colors.black,
                    ),
                  ),
                ),
              ),
              Container(
                height: 70,
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: EdgeInsets.only(left: 35, right: 35),
                  child: ElevatedButton(
                    onPressed: () {
                      _showNicknameInputDialog(context);
                      print('Change Nickname');
                    },
                    child: Row(
                      children: [
                        Icon(Icons.person, color: Colors.black),
                        SizedBox(width: 10),
                        Text("Change Nickname",
                            style:
                                TextStyle(fontSize: 20, color: Colors.black)),
                      ],
                    ),
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(320, 50),
                      backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      shadowColor: Colors.black,
                    ),
                  ),
                ),
              ),
              Container(
                height: 70,
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: EdgeInsets.only(left: 35, right: 35),
                  child: ElevatedButton(
                    onPressed: () {
                      _showPasswordInputDialog(context);
                    },
                    child: Row(
                      children: [
                        Icon(Icons.lock, color: Colors.black),
                        SizedBox(width: 10),
                        Text("Change Password",
                            style:
                                TextStyle(fontSize: 20, color: Colors.black)),
                      ],
                    ),
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(320, 50),
                      backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      shadowColor: Colors.black,
                    ),
                  ),
                ),
              ),
              Container(
                height: 70,
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: EdgeInsets.only(left: 35, right: 35),
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
              ),
              Container(
                height: 70,
                alignment: Alignment.bottomCenter,
                child: LogoutButton(),
              )
            ],
          ),
        ),
      ),
    );
  }

  void _showBudgetInputDialog(BuildContext context) {
    final TextEditingController _budgetController = TextEditingController();
    final _formKey = GlobalKey<FormState>();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            'Your current budget:\$${userInfo.budget.toString()}',
            style: TextStyle(color: Colors.green),
          ),
          content: Form(
            key: _formKey,
            child: TextFormField(
              controller: _budgetController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(hintText: 'Enter budget amount'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Budget cannot be empty';
                }
                return null;
              },
            ),
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState?.validate() ?? false) {
                  setState(() {
                    userUpdateService.updateUserbudget(
                        userId!, int.parse(_budgetController.text));
                    userInfo.budget = int.parse(_budgetController.text);
                  });
                  Navigator.of(context).pop(); // Close the dialog
                  print('Budget entered: ${_budgetController.text}');

                  // You can add further logic here to handle the budget input
                }
              },
              child: Text('Submit'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: Text('Cancel'),
            ),
          ],
        );
      },
    );
  }

  void _showNicknameInputDialog(BuildContext context) {
    final TextEditingController _nicknameController = TextEditingController();
    final _formKey = GlobalKey<FormState>();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Your current nickname:' + userInfo.nickname),
          content: Form(
            key: _formKey,
            child: TextFormField(
              controller: _nicknameController,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(hintText: 'Enter new nickname'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Nickname cannot be empty';
                }
                return null;
              },
            ),
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState?.validate() ?? false) {
                  setState(() {
                    userUpdateService.updateUsernickname(
                        userId!, _nicknameController.text);
                    userInfo.nickname = _nicknameController.text;
                  });
                  Navigator.of(context).pop(); // Close the dialog
                  print('Nickname entered: ${_nicknameController.text}');

                  // You can add further logic here to handle the budget input
                }
              },
              child: Text('Submit'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: Text('Cancel'),
            ),
          ],
        );
      },
    );
  }

  void _showPasswordInputDialog(BuildContext context) {
    final TextEditingController _passwordController = TextEditingController();
    final _formKey = GlobalKey<FormState>();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Your current password:' + userInfo.password),
          content: Form(
            key: _formKey,
            child: TextFormField(
              controller: _passwordController,
              keyboardType: TextInputType.visiblePassword,
              decoration: InputDecoration(hintText: 'Enter new password'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Password cannot be empty';
                }
                return null;
              },
            ),
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState?.validate() ?? false) {
                  setState(() {
                    userUpdateService.updateUsernickname(
                        userId!, _passwordController.text);
                    userInfo.password = _passwordController.text;
                  });
                  Navigator.of(context).pop(); // Close the dialog
                  print('Password entered: ${_passwordController.text}');

                  // You can add further logic here to handle the budget input
                }
              },
              child: Text('Submit'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: Text('Cancel'),
            ),
          ],
        );
      },
    );
  }
}

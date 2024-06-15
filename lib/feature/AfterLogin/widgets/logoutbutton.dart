import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:jimoney_frontend/authentication/Login/bloc/login_bloc.dart';

class LogoutButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: EdgeInsets.only(left: 35, right: 35),
        child: ElevatedButton(
          onPressed: () {
            _showLogoutWarning(context);
          },
          child: Row(
            children: [
              Icon(
                Icons.logout,
                color: Colors.black,
              ),
              SizedBox(width: 10),
              Text(
                "Log Out",
                style: TextStyle(fontSize: 20, color: Colors.black),
              ),
            ],
          ),
          style: ElevatedButton.styleFrom(
            minimumSize: Size(320, 50),
            backgroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            shadowColor: Colors.black,
          ),
        ),
      ),
    );
  }

  void _showLogoutWarning(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Confirm Logout'),
          content: Text('Are you sure you want to log out?'),
          actions: <Widget>[
            TextButton(
              child: Text(
                'Cancel',
                style: TextStyle(color: Colors.black),
              ),
              onPressed: () {
                BlocProvider.of<LoginBloc>(context).add(LogoutEvent());
                context.push("/login");
              },
            ),
            TextButton(
              child: Text(
                'Log Out',
                style: TextStyle(color: Colors.red),
              ),
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
                context.go("/login"); // Navigate to the login page
              },
            ),
          ],
        );
      },
    );
  }
}

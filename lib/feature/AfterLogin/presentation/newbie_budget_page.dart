import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class NewbieBudgetPage extends StatefulWidget {
  const NewbieBudgetPage({super.key});
  
  static String path = "/budget";
  @override
  State<NewbieBudgetPage> createState() => _NewbieBudgetPageState();
}

class _NewbieBudgetPageState extends State<NewbieBudgetPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color(0XFFFFD9D9),
        child: Column(
          children: <Widget>[
            Container(
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.only(left: 30, bottom: 10),
                child: Text(
                  "Enter your Budget:",
                  style: TextStyle(
                      fontSize: 30,
                      color: Colors.white,
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Container(
              width: double.infinity,
              child: Text("0", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              alignment: Alignment.center,
            ),
          ],
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:jimoney_frontend/Register/presentation/login_page.dart';

class BudgetPage extends StatefulWidget {
  const BudgetPage({super.key});

  static String path = "/budget";

  @override
  State<BudgetPage> createState() => _BudgetPageState();
}

class _BudgetPageState extends State<BudgetPage> {
  String budget = '';
  final TextEditingController _budgetController = TextEditingController();

  @override
  Future<void> _fetchApiData() async {
    final String baseUrl = 'http://54.179.125.22:5000/user/update_budget';
    final int userid = uid;
    budget = _budgetController.text;
    if(budget == ''){
      return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Error'),
            content: Text('Please enter your budget'),
            actions: [
              TextButton(
                child: Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }
    final String apiUrl = '$baseUrl?user_id=$userid&new_budget=$budget';
    try {
      var response = await http.put(
        Uri.parse(apiUrl),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8'
        },
        body: jsonEncode(<String, String>{
          'budget': budget,
        }),
        );
      if (response.statusCode == 200) {
        print('Server response: ${response.statusCode}');
        print('Response body: ${response.body}');
        setState(() {
          print('Decode Successfully');
          GoRouter.of(context).go('/home');
        });
      } else {
        print("Failed to load data");
      }
    } catch (e) {
      print("Error: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.maxFinite,
        height: double.maxFinite,
        color: Color(0XFFFFD9D9),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(top: 80),
              child: Text(
                'Budget Page',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontStyle: FontStyle.italic,
                  shadows: [
                    Shadow(
                      blurRadius: 5.0,
                      color: Colors.black,
                      offset: Offset(1.0, 1.0),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              width: 170,
              height: 170,
              padding: EdgeInsets.only(top: 20, bottom: 50),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(  
                  shape: CircleBorder(
                    side: BorderSide(color: Colors.white, width: 2),
                  ),
                ),
                onPressed: () {
                  GoRouter.of(context).go('/home');
                },
                child: Text('skip', style: TextStyle(fontSize: 24, color: Color(0XFFF84490), fontWeight: FontWeight.bold, fontStyle: FontStyle.italic),),
              
              ),
            ),
            Container(
              child: Column(
                children: [
                  Text("Enter your budget", style: TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold, fontStyle: FontStyle.italic),),
                  Padding(
                    padding: const EdgeInsets.only(top: 20, left: 45, right: 45),
                    child: TextField(
                      controller: _budgetController,
                      decoration: InputDecoration(
                        fillColor: Colors.white,
                        border: OutlineInputBorder(),
                        labelText: 'Budget',
                        filled: true,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            ElevatedButton(
              onPressed: () {
                _fetchApiData();
            },
              child: Text("Submit", style: TextStyle(fontSize: 20, color: Colors.black),),
            ),
          ],
        ),
      ),
    );
  }
}


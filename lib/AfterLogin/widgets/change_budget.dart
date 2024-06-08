import 'package:flutter/material.dart';
import 'package:jimoney_frontend/Register/presentation/login_page.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ChangeBudget extends StatefulWidget {
  const ChangeBudget({super.key});

  @override
  State<ChangeBudget> createState() => _ChangeBudgetState();
}

class _ChangeBudgetState extends State<ChangeBudget> {
  String budget = '';

  @override
  Future<void> _fetchApiData() async {
    final String baseUrl = 'http://54.179.125.22:5000/user/update_budget';
    final int userid = uid;
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
        });
      } else {
        print("Failed to load data");
      }
    } catch (e) {
      print("Error: $e");
    }
  }

  void _showBudgetInputDialog(BuildContext context) {
    final TextEditingController _budgetController = TextEditingController();
    final _formKey = GlobalKey<FormState>();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Enter your budget'),
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
                    budget = _budgetController.text;
                    _fetchApiData();
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

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      alignment: Alignment.bottomCenter,
      child: ElevatedButton(
        onPressed: () {
          _showBudgetInputDialog(context);
        },
        child: Text("Change Budget",
            style: TextStyle(fontSize: 20, color: Colors.black)),
        style: ElevatedButton.styleFrom(
          minimumSize: Size(320, 50),
          backgroundColor: Colors.white,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          shadowColor: Colors.black,
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:jimoney_frontend/Register/presentation/login_page.dart';
import 'package:jimoney_frontend/AfterLogin/widgets/total_cost.dart';

class BudgetSlider extends StatefulWidget {
  const BudgetSlider({super.key});

  @override
  State<BudgetSlider> createState() => _BudgetSliderState();
}

class _BudgetSliderState extends State<BudgetSlider> {
  double _budget = 1000.0;
  double _cost = 400.0;
  double _remainingBudgetPercent = 0.6;

  @override
  void initState() {
    super.initState();
    _cost = sum.toDouble();
    _updateRemainingBudget();
    
  }

  // 更新剩余预算百分比
  void _updateRemainingBudget() {
    setState(() {
      _remainingBudgetPercent = (_budget - _cost) / _budget;
    });
  }

  @override
  Future<void> _fetchApiData() async {
    final String baseUrl = 'http://54.179.125.22:5000/user/get_budget';
    final int userid = uid;
    final String apiUrl = '$baseUrl?user_id=$userid';
    try {
      var response = await http.put(
        Uri.parse(apiUrl),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8'
        },
        body: jsonEncode(<String, String>{
          'budget': _budget.toString(),
        }),
      );
      if (response.statusCode == 200) {
        print('Server response: ${response.statusCode}');
        print('Response body: ${response.body}');
        setState(() {
          _budget = double.parse(response.body);
          _updateRemainingBudget();
        });
      } else {
        print("Failed to load data");
      }
    } catch (e) {
      print("Error: $e");
    }
  }

  String percentage() {
    return (_remainingBudgetPercent * 100).toString();
  }

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      child: Column(
        children: [
          Text(percentage() + '%', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold), ),
          Slider(
            value: _remainingBudgetPercent,
            onChanged: (double value) {
              setState(() {
                _remainingBudgetPercent = value;
                _updateRemainingBudget();
              });
            },
            min: 0,
            max: 1,
            divisions: 100,
            label: 'Budget',
          ),
        ],
      ),
    );
  }
}

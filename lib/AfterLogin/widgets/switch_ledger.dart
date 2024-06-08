import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:jimoney_frontend/Register/presentation/login_page.dart';

class SwitchLedger extends StatefulWidget {
  const SwitchLedger({super.key});

  @override
  State<SwitchLedger> createState() => _SwitchLedgerState();
}

String? _selectedLedger;

class _SwitchLedgerState extends State<SwitchLedger> {

  List<String> _ledgers = [];

  @override
  void initState() {
    super.initState();
    _fetchLedgers();
  }

  Future<void> _fetchLedgers() async {
    final String baseUrl = 'http://54.179.125.22:5000/ledger/get_ledgers_name';
    final int userId = uid; // Replace with actual user ID
    final String apiUrl = '$baseUrl?user_id=$userId';

    try {
      var response = await http.get(Uri.parse(apiUrl));
      if (response.statusCode == 200) {
        List<dynamic> data = jsonDecode(response.body);
        setState(() {
          _ledgers = data.map((ledger) => ledger.toString()).toList();
          if (_ledgers.isNotEmpty) {
            _selectedLedger = _ledgers[0];
          }
        });
      } else {
        print("Failed to load ledgers");
      }
    } catch (e) {
      print("Error: $e");
    }
  }

  void _onLedgerChanged(String? newLedger) {
    setState(() {
      _selectedLedger = newLedger;
      
    });
    // Add your logic here to handle ledger switch
    print("Switched to ledger: $_selectedLedger");
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: _selectedLedger,
      icon: Icon(Icons.arrow_drop_down),
      iconSize: 24,
      elevation: 16,
      style: TextStyle(color: Colors.black),
      underline: Container(
        height: 2,
        color: Colors.grey,
      ),
      onChanged: _onLedgerChanged,
      items: _ledgers.map<DropdownMenuItem<String>>((String ledger) {
        return DropdownMenuItem<String>(
          value: ledger,
          child: Text(ledger),
        );
      }).toList(),
    );
  }
}
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:jimoney_frontend/DataBase/ledger.dart';

class LedgerUpdateService {
  final String baseUrl = 'http://54.179.125.22:5000';

  Future<void> insertLedger(int wallet_id, String ledger_name) async {
    final url = Uri.parse(
        "$baseUrl/ledger/insert_ledger?wallet_id=$wallet_id&ledger_name=$ledger_name");
    try {
      final response = await http.post(
        url,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8'
        },
        body: jsonEncode(<String, dynamic>{
          'ledger_name': ledger_name,
        }),
      );
      if (response.statusCode == 200) {
        print('Insert Ledger:$ledger_name Successfully');
      } else {
        print("Failed to load data");
      }
    } catch (e) {
      print("Error: $e");
    }
  }

  Future<List<String>?> deleteLedger(int ledger_id) async {
    final url = Uri.parse("$baseUrl/ledger/delete_ledger?ledger_id=$ledger_id");
    try {
      final response = await http.delete(
        url,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8'
        },
        body: jsonEncode(<String, dynamic>{
          'ledger_id': ledger_id,
        }),
      );
      if (response.statusCode == 200) {
        print('Delete LedgerID:$ledger_id Successfully');
      } else {
        print("Failed to load data");
      }
    } catch (e) {
      print("Error: $e");
    }
  }

  Future<void> updateLedger(int ledger_id, int wid, String Lname) async {
    final url = Uri.parse(
        "$baseUrl/ledger/update_ledger?ledger_id=$ledger_id&wallet_id=$wid&ledger_name=$Lname");
    try {
      final response = await http.put(
        url,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8'
        },
        body: jsonEncode(<String, dynamic>{
          'ledger_id': ledger_id,
          'wallet_id': wid,
          'ledger_name': Lname,
        }),
      );
      if (response.statusCode == 200) {
        print('UpdateLedgerServer response: ${response.statusCode}');
        print('Response body: ${response.body}');
        print('Update New Ledger:$Lname Successfully');
      } else {
        print("Failed to load data");
      }
    } catch (e) {
      print("Error: $e");
    }
  }
}

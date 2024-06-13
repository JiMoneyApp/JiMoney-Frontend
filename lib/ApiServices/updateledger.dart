import 'dart:convert';
import 'package:http/http.dart' as http;

class LedgerUpdateService {

  final String baseUrl = 'http://54.179.125.22:5000';

  Future<List<String>?> insertLedger(int userId, String ledger_name) async {
    final url = Uri.parse("$baseUrl/ledger/insert_ledger?user_id=$userId&ledger_name=$ledger_name");
    try {
      final response = await http.put(
        url,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8'
        },
        body: jsonEncode(<String, String>{
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

  Future<List<String>?> deleteLedger(int userId, String ledger_name) async {
    final url = Uri.parse("$baseUrl/ledger/delete_ledger?user_id=$userId&ledger_name=$ledger_name");
    try {
      final response = await http.delete(
        url,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8'
        },
        body: jsonEncode(<String, String>{
          'ledger_name': ledger_name,
        }),
        );
      if (response.statusCode == 200) {
        print('Delete Ledger:$ledger_name Successfully');
      } else {
        print("Failed to load data");
      }
    } catch (e) {
      print("Error: $e");
    }
  }
  
  Future<List<String>?> updateLedger(int userId, String old_ledger_name, String new_ledger_name) async {
    final url = Uri.parse("$baseUrl/ledger/delete_ledger?user_id=$userId&old_ledger_name=$old_ledger_name&new_ledger_name=$new_ledger_name");
    try {
      final response = await http.put(
        url,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8'
        },
        body: jsonEncode(<String, String>{
          'new_ledger_name': new_ledger_name,
        }),
        );
      if (response.statusCode == 200) {
        print('Server response: ${response.statusCode}');
        print('Response body: ${response.body}');
        print('Update Old Ledger:$old_ledger_name -> New Ledger:$new_ledger_name Successfully');
      } else {
        print("Failed to load data");
      }
    } catch (e) {
      print("Error: $e");
    }
  }
}

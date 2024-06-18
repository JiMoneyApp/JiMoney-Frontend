import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:jimoney_frontend/DataBase/ledger.dart';

class DataUpdateService {
  final String baseUrl = 'http://54.179.125.22:5000';

  Future<void> insert_new_data(int userId, String ledger_name, int price,
      String data_name, String data_type, String data_date) async {
    final url = Uri.parse(
        "$baseUrl/data/insert_new_data?user_id=$userId&ledger_name=$ledger_name&price=$price&data_name=$data_name&data_type=$data_type&data_date=$data_date");
    try {
      final response = await http.put(
        url,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8'
        },
        body: jsonEncode(<String, dynamic>{
          'user_id': userId,
          'ledger_name': ledger_name,
          'price': price,
          'data_name': data_name,
          'data_type': data_type,
          'data_date': data_date,
        }),
      );
      if (response.statusCode == 200) {
        print('Insert Data:$data_name Successfully');
        print("Response body: ${response.body}");
      } else {
        print("Failed to insert data into $ledger_name");
        print("Response body: ${response.body}");
      }
    } catch (e) {
      print("Error: $e");
    }
  }

  Future<String?> updateDataName(int userId, String ledger_name) async {
    final url = Uri.parse(
        "$baseUrl/ledger/delete_ledger?user_id=$userId&ledger_name=$ledger_name");
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

  Future<int?> updateDataPrice(
      int userId, String old_ledger_name, String new_ledger_name) async {
    final url = Uri.parse(
        "$baseUrl/ledger/delete_ledger?user_id=$userId&old_ledger_name=$old_ledger_name&new_ledger_name=$new_ledger_name");
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
        print(
            'Update Old Ledger:$old_ledger_name -> New Ledger:$new_ledger_name Successfully');
      } else {
        print("Failed to load data");
      }
    } catch (e) {
      print("Error: $e");
    }
  }
}

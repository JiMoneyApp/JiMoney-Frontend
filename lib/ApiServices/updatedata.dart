import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:jimoney_frontend/DataBase/ledger.dart';

class DataUpdateService {
  final String baseUrl = 'http://54.179.125.22:5000';

  Future<void> insert_new_data(int userId, int price, String dname,
      String dtype, String ddate, int? lid, int? gid) async {
    final url = Uri.parse(
        "$baseUrl/data/insert_new_data?user_id=$userId&price=$price&dname=$dname&dtype=$dtype&ddate=$ddate&lid=$lid&gid=$gid");
    try {
      final response = await http.put(
        url,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8'
        },
        body: jsonEncode(<String, dynamic>{
          'user_id': userId,
          'price': price,
          'dname': dname,
          'dtype': dtype,
          'ddate': ddate,
          'lid': lid,
          'gid': gid,
        }),
      );
      if (response.statusCode == 200) {
        print('Insert Data:$dname Successfully');
        print("Response body: ${response.body}");
      } else {
        print("Failed to insert data into userId = $userId");
        print("Response body: ${response.body}");
      }
    } catch (e) {
      print("Error: $e");
    }
  }

  Future<void> updateDataName(int userId, String ledger_name) async {
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

  Future<void> updateData(int userId, Ledger new_data, int lid, int gid) async {
    final url = Uri.parse(
        "$baseUrl/data/update_data?user_id=$userId&new_data=$new_data&lid=$lid&gid=$gid");
    try {
      final response = await http.post(
        url,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8'
        },
        body: jsonEncode(<String, dynamic>{
          'user_id': userId,
          'new_data': new_data,
          'lid': lid,
          'gid': gid,
        }),
      );
      if (response.statusCode == 200) {
        print('Server response: ${response.statusCode}');
        print('Response body: ${response.body}');
        print('Update Successfully');
      } else {
        print("Failed to load data");
      }
    } catch (e) {
      print("Error: $e");
    }
  }

  Future<void> deleteData(int data_id) async {
    final url = Uri.parse("$baseUrl/data/delete_data?data_id=$data_id");
    try {
      final response = await http.delete(
        url,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8'
        },
        body: jsonEncode(<String, dynamic>{'data_id': data_id}),
      );
      if (response.statusCode == 200) {
        print('Server response: ${response.statusCode}');
        print('Response body: ${response.body}');
        print('Delete Data_id = $data_id Successfully');
      } else {
        print("Failed to load data");
      }
    } catch (e) {
      print("Error: $e");
    }
  }
}

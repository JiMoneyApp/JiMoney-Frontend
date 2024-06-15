import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:jimoney_frontend/DataBase/ledger.dart';

class DataService {
  Future<List<Ledger>?> fetchDatas(int userId, String ledger_name) async {
    final String baseUrl = 'http://54.179.125.22:5000';
    final url = Uri.parse(
        "$baseUrl/data/get_ledger_datas?user_id=$userId&ledger_name=$ledger_name");
    //print("FUCK");
    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        //print(response.body[0]);
        //print("STOP3");
        List<dynamic> jsonResponse = jsonDecode(response.body);
        //print("STOP4");
        return jsonResponse.map((data) => Ledger.fromJson(data)).toList();
      } else {
        // print("DEADASFUCK");
      }
    } catch (e) {
      //print("DEAD");
      print("Error: $e");
      return [];
    }
  }
}

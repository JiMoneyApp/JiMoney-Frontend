import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:jimoney_frontend/DataBase/ledger.dart';

class DataService {
  final String baseUrl = 'http://54.179.125.22:5000';

  Future<List<Ledger>?> fetchDatas(int userId, String ledgerName) async {
    final url = Uri.parse(
        "$baseUrl/data/get_ledger_datas?user_id=$userId&ledger_name=$ledgerName");
    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        List<dynamic> jsonResponse = jsonDecode(response.body);
        return jsonResponse.map((data) => Ledger.fromJson(data)).toList();
      } else {
        print("Failed to fetch data. Status code: ${response.statusCode}");
        print("Response body: ${response.body}");
        return null;
      }
    } catch (e) {
      print("Error fetching data: $e");
      return null;
    }
  }
}

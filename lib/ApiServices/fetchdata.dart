import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:jimoney_frontend/DataBase/datas.dart';

class DataService {
  final String baseUrl = 'http://54.179.125.22:5000';

  Future<List<Datas>?> fetchDatas(int userId) async {
    final url = Uri.parse("$baseUrl/data/get_all_datas?user_id=$userId");
    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        List<dynamic> jsonResponse = jsonDecode(response.body);
        print("fetchdddddd");
        print(jsonResponse.map((data) => Datas.fromJson(data)).toList());
        print("ffffetch");
        return jsonResponse.map((data) => Datas.fromJson(data)).toList();
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

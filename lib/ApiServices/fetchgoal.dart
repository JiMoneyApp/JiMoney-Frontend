import 'dart:convert';
import 'package:http/http.dart' as http;

class GoalService {
  final String baseUrl = 'http://54.179.125.22:5000';

  Future<dynamic> fetchAllGoals(int user_id) async {
    final String baseUrl = 'http://54.179.125.22:5000';
    final url = Uri.parse("$baseUrl/goals/get_all_goals?user_id=$user_id");

    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);

        print(response.body);
        print(data.map((item) => item[0].toString()).toList());
        return data.map((item) => item[0].toString()).toList();
      } else {}
    } catch (e) {
      //print("DEAD");
      print("Error: $e");
      return [];
    }
  }

  Future<dynamic> fetchMyPartnerGoal(int data_id) async {
    final String baseUrl = 'http://54.179.125.22:5000';
    final url =
        Uri.parse("$baseUrl/goals/get_my_partner_goal?data_id=$data_id");

    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);

        print(response.body);
        print(data.map((item) => item[0].toString()).toList());
        return data.map((item) => item[0].toString()).toList();
      } else {}
    } catch (e) {
      //print("DEAD");
      print("Error: $e");
      return [];
    }
  }
}

import 'dart:convert';
import 'package:http/http.dart' as http;

class UserUpdateService {
  final String baseUrl = "http://54.179.125.22:5000";
  Future<String?> updateUserpassword(int userId, String password) async {
    // print(userId + " " + password);
    final url = Uri.parse(
        "$baseUrl/user/update_password?user_id=$userId&new_password=$password");

    try {
      final response = await http.put(
        url,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          'new_password': password,
        }),
      );

      if (response.statusCode == 200) {
        print(response.body);
        return response.body;
      } else {
        throw Exception("Failed to load user password");
      }
    } catch (e) {
      print("Error: $e");
      return null;
    }
  }

  Future<String?> updateUseraccount(int userId, String account) async {
    // print(userId + " " + account);
    final url =
        Uri.parse("$baseUrl/user/update_acc?user_id=$userId&new_acc=$account");

    try {
      final response = await http.put(
        url,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          'new_acc': account,
        }),
      );

      if (response.statusCode == 200) {
        print(response.body);
        return response.body;
      } else {
        throw Exception("Failed to load user password");
      }
    } catch (e) {
      print("Error: $e");
      return null;
    }
  }

  Future<String?> updateUsernickname(int userId, String nickname) async {
    // print(userId + " " + nickname);
    final url = Uri.parse(
        "$baseUrl/user/update_nname?user_id=$userId&new_nname=$nickname");

    try {
      final response = await http.put(
        url,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          'new_nname': nickname,
        }),
      );

      if (response.statusCode == 200) {
        print(response.body);
        return response.body;
      } else {
        throw Exception("Failed to load user nickname");
      }
    } catch (e) {
      print("Error: $e");
      return null;
    }
  }

  Future<String?> updateUsernoticetime(int userId, String noticetime) async {
    // print(userId + " " + noticetime);
    final url = Uri.parse(
        "$baseUrl/user/update_ntime?user_id=$userId&new_ntime=$noticetime");

    try {
      final response = await http.put(
        url,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          'new_nname': noticetime,
        }),
      );

      if (response.statusCode == 200) {
        print(response.body);
        return response.body;
      } else {
        throw Exception("Failed to load user noticetime");
      }
    } catch (e) {
      print("Error: $e");
      return null;
    }
  }

  Future<String?> updateUserbudget(int userId, int newbudget) async {
    // print(userId + " " + budget.toString());
    final url = Uri.parse(
        "$baseUrl/user/update_budget?user_id=$userId&new_budget=$newbudget");

    try {
      final response = await http.put(
        url,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          'new_budget': newbudget.toString(),
        }),
      );

      if (response.statusCode == 200) {
        print(response.body);
        print('Decode Successfully, new budget = $newbudget');
        return response.body;
      } else {
        throw Exception("Failed to load user budget");
      }
    } catch (e) {
      print("Error: $e");
      return null;
    }
  }
}

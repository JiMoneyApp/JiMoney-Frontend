import 'dart:convert';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;

class UserService {
  final String baseUrl =
      "http://54.179.125.22:5000"; // Replace with your backend URL

  // Future<String?> fetchUserName(String userId) async {
  //   final url = Uri.parse("$baseUrl/user/get_name?user_id=$userId");

  //   try {
  //     final response = await http.get(url);

  //     if (response.statusCode == 200) {
  //       final data = json.decode(response.body);
  //       return data['UName'];
  //     } else {
  //       throw Exception("Failed to load user name");
  //     }
  //   } catch (e) {
  //     print("Error: $e");
  //     return null;
  //   }
  // }

  Future<int?> fetchUserId(String username, String password) async {
    print(username + " " + password);
    final url = Uri.parse(
        "$baseUrl/user/get_user_id?user_acc=$username&user_password=$password");

    try {
      final response = await http.post(
        url,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          'user_acc': username,
          'user_password': password,
        }),
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        print(response.body);
        print(data[0]);
        if (data[0] != null) {
          return data[0];
        } else {
          print("Error: 'UID' not found in the response");
          return null;
        }
      } else {
        throw Exception("Failed to load user ID");
      }
    } catch (e) {
      print("Error: $e");
      return null;
    }
  }

  Future<String?> fetchUserNickname(int userId) async {
    final url = Uri.parse("$baseUrl/user/get_nname?user_id=$userId");

    try {
      final response = await http.post(
        url,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, int>{
          'user_id': userId,
        }),
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        print(data[0]);
        return data[0];
      } else {
        throw Exception("Failed to load user nickname");
      }
    } catch (e) {
      print("Failed to load user nickname");
      print("Error: $e");
      return null;
    }
  }

  Future<int?> fetchUserBudget(int userId) async {
    final url = Uri.parse("$baseUrl/user/get_budget?user_id=$userId");

    try {
      final response = await http.post(
        url,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, int>{
          'user_id': userId,
        }),
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        print(data[0]);
        return data[0];
      } else {
        throw Exception("Failed to load user nickname");
      }
    } catch (e) {
      print("Failed to load user nickname");
      print("Error: $e");
      return null;
    }
  }

  // Future<bool?> fetchUserIsDark(int userId) async {
  //   final url = Uri.parse("$baseUrl/user/get_isdark?user_id=$userId");

  //   try {
  //     final response = await http.post(
  //       url,
  //       headers: <String, String>{
  //         'Content-Type': 'application/json; charset=UTF-8',
  //       },
  //       body: jsonEncode(<String, int>{
  //         'user_id': userId,
  //       }),
  //     );

  //     if (response.statusCode == 200) {
  //       final data = json.decode(response.body);
  //       print("dataisdark" + data[0]);
  //       return data[0];
  //     } else {
  //       throw Exception("Failed to load user isdark");
  //     }
  //   } catch (e) {
  //     print("Failed to load user isdark");
  //     print("Error: $e");
  //     return null;
  //   }
  // }

  Future<String?> fetchUserNoticeTime(int userId) async {
    final url = Uri.parse("$baseUrl/user/get_ntime?user_id=$userId");

    try {
      final response = await http.post(
        url,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, int>{
          'user_id': userId,
        }),
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        print("data is ntime" + data[0]);
        return data[0];
      } else {
        throw Exception("Failed to load user notice time");
      }
    } catch (e) {
      print("Failed to load user notice time");
      print("Error: $e");
      return null;
    }
  }

//   Future<bool?> fetchUserRightHandedStatus(int userId) async {
//     final url = Uri.parse('$baseUrl/user/get_isright?user_id=$userId');

//     try {
//       final response = await http.get(url);

//       if (response.statusCode == 200) {
//         final data = json.decode(response.body);
//         return data['isrightHander'] == 1;
//       } else {
//         throw Exception("Failed to load user right-handed status");
//       }
//     } catch (e) {
//       print("Error: $e");
//       return null;
//     }
//   }
}

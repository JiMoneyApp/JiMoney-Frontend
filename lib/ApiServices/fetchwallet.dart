import 'dart:convert';
import 'package:http/http.dart' as http;

class WalletService {
  final String baseUrl = 'http://54.179.125.22:5000';

  Future<List<String>?> fetchAllWalletsName(int userId) async {
    final String baseUrl = 'http://54.179.125.22:5000';
    final url = Uri.parse("$baseUrl/wallet/get_all_wallets?user_id=$userId");

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

import 'dart:convert';
import 'package:http/http.dart' as http;

class LedgerService {
  Future<List<String>?> fetchLedgersName(int userId) async {
    final String baseUrl = 'http://54.179.125.22:5000';
    final url = Uri.parse("$baseUrl/ledger/get_ledgers_name?user_id=$userId");

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

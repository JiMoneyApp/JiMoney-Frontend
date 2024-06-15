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
        //print("STOP1");
        print(data.map((item) => item[0].toString()).toList());
        //print("STOP2");
        return data.map((item) => item[0].toString()).toList();
      }
      else{
        //print("DEADASFUCK");
      }
    } catch (e) {
      //print("DEAD");
      print("Error: $e");
      return [];
    }
  }

  Future<int?> fetchLedgersSum(int userId, String ledger_name) async {
    final String baseUrl = 'http://54.179.125.22:5000';
    final url = Uri.parse("$baseUrl/ledger/get_ledgers_sum?user_id=$userId&ledger_name=$ledger_name");

    try {
      final response = await http.get(url);
      print(response.body);
      if (response.statusCode == 200) {
        return response.body as int;
      }
      else{
        //print("DEADASFUCK");
        return 0;
      }
    } catch (e) {
      //print("DEAD");
      print("Error: $e");
      return 0;
    }
  }
}

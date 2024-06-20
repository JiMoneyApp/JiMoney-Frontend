import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:jimoney_frontend/DataBase/datas.dart';
import 'package:jimoney_frontend/feature/common/ledger.dart';

class LedgerService {
  final String baseUrl = 'http://54.179.125.22:5000';

  Future<List<LedgerByWallet>?> fetchAllLedgersbyWallet(int wallet_id) async {
    final String baseUrl = 'http://54.179.125.22:5000';
    final url = Uri.parse("$baseUrl/ledger/get_ledgers?wallet_id=$wallet_id");

    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);

        print(response.body);
        print(data.map((item) => item[0].toString()).toList());
        return data.map((json) => LedgerByWallet.fromJson(json)).toList();
      } else {}
    } catch (e) {
      //print("DEAD");
      print("Error: $e");
      return [];
    }
  }

  Future<int?> fetchLedgersSum(int userId, String ledger_name) async {
    final String baseUrl = 'http://54.179.125.22:5000';
    final url = Uri.parse(
        "$baseUrl/ledger/get_ledgers_sum?user_id=$userId&ledger_name=$ledger_name");

    try {
      final response = await http.get(url);
      print(response.body);
      if (response.statusCode == 200) {
        return response.body as int;
      } else {
        //print("DEADASFUCK");
        return 0;
      }
    } catch (e) {
      //print("DEAD");
      print("Error: $e");
      return 0;
    }
  }

  Future<dynamic> fetchLedgerAllDatas(int ledger_id) async {
    final url =
        Uri.parse("$baseUrl/ledger/get_ledger_all_datas?ledger_id=$ledger_id");
    try {
      final response = await http.put(
        url,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8'
        },
        body: jsonEncode(<String, dynamic>{
          'ledger_id': ledger_id,
        }),
      );
      if (response.statusCode == 200) {
        print('Get Ledger All DATAS: ${response.statusCode}');
        print('Response body: ${response.body}');
        return jsonDecode(response.body);
      } else {
        print("Failed to load data");
      }
    } catch (e) {
      print("Error: $e");
    }
  }

  Future<dynamic> fetchMyPartnerLedger(int data_id) async {
    final url =
        Uri.parse("$baseUrl/ledger/get_my_partner_ledger?data_id=$data_id");
    try {
      final response = await http.put(
        url,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8'
        },
        body: jsonEncode(<String, dynamic>{
          'data_id': data_id,
        }),
      );
      if (response.statusCode == 200) {
        print('FetchMyPartnerLedger Server response: ${response.statusCode}');
        print('Response body: ${response.body}');
        return jsonDecode(response.body);
      } else {
        print("Failed to load data");
      }
    } catch (e) {
      print("Error: $e");
    }
  }

  Future<dynamic> fetchWalletAllLedgers(int wallet_id) async {
    final url =
        Uri.parse("$baseUrl/ledger/get_wallet_all_ledger?wallet_id=$wallet_id");
    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        print('FetchWalleetAllLedgers Server response: ${response.statusCode}');
        print('Response body: ${response.body}');
        return jsonDecode(response.body);
      } else {
        print("Failed to load data");
      }
    } catch (e) {
      print("Error: $e");
    }
  }

  Future<List<Ledger>> fetchAllLedgers(int userId) async {
    final url = Uri.parse("$baseUrl/ledger/get_all_ledgers?user_id=$userId");
    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        print('FetchAllLedgers Server response: ${response.statusCode}');
        print('Response body: ${response.body}');
        List<dynamic> data = jsonDecode(response.body);
        return data.map((json) => Ledger.fromJson(json)).toList();
      } else {
        print("Failed to load data");
        return [];
      }
    } catch (e) {
      print("Error: $e");
      return [];
    }
  }
}

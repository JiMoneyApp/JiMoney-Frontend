import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:jimoney_frontend/feature/common/wallet.dart';

class WalletService {
  final String baseUrl = 'http://54.179.125.22:5000';

  Future<List<Wallet>> fetchAllWallets(int userId) async {
    final url = Uri.parse("$baseUrl/wallet/get_all_wallets?user_id=$userId");
    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        print('FetchAllWallets Server response: ${response.statusCode}');
        print('Response body: ${response.body}');
        List<dynamic> data = jsonDecode(response.body);
        return data.map((json) => Wallet.fromJson(json)).toList();
      } else {
        print("Failed to load wallets.");
        return [];
      }
    } catch (e) {
      print("Error: $e");
      return [];
    }
  }
}

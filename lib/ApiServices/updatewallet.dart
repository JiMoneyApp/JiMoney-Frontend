import 'dart:convert';
import 'package:http/http.dart' as http;

class WalletUpdateServie {
  final String baseUrl = "http://54.179.125.22:5000";

  Future<void> insertWallet(int user_id, String wallet_name) async {
    final url = Uri.parse(
        "$baseUrl/wallet/insert_wallet?user_id=$user_id&wallet_name=$wallet_name");
    try {
      final response = await http.put(
        url,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8'
        },
        body: jsonEncode(<String, dynamic>{
          'user_id': user_id,
          'wallet_name': wallet_name,
        }),
      );
      if (response.statusCode == 200) {
        print('Insert Wallet:$wallet_name Successfully');
      } else {
        print("Failed to load data");
      }
    } catch (e) {
      print("Error: $e");
    }
  }

  Future<void> deleteWallet(int wallet_id) async {
    final url = Uri.parse("$baseUrl/wallet/delete_wallet?wallet_id=$wallet_id");
    try {
      final response = await http.delete(
        url,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8'
        },
        body: jsonEncode(<String, dynamic>{
          'wallet_id': wallet_id,
        }),
      );
      if (response.statusCode == 200) {
        print('Delete Wallet:$wallet_id Successfully');
      } else {
        print("Failed to load data");
      }
    } catch (e) {
      print("Error: $e");
    }
  }

  Future<void> updateWallet(int wallet_id, String new_wallet_name) async {
    final url = Uri.parse(
        "$baseUrl/wallet/update_wallet?wallet_id=$wallet_id&wallet_name=$new_wallet_name");
    try {
      final response = await http.put(
        url,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8'
        },
        body: jsonEncode(<String, dynamic>{
          'wallet_id': wallet_id,
          'wallet_name': new_wallet_name,
        }),
      );
      if (response.statusCode == 200) {
        print(
            'Update Wallet:$new_wallet_name walletID:$wallet_id Successfully');
      } else {
        print("Failed to load data");
      }
    } catch (e) {
      print("Error: $e");
    }
  }
}

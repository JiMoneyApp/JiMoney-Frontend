import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:jimoney_frontend/DataBase/ledger.dart';
import 'package:jimoney_frontend/Register/presentation/login_page.dart';

class TotalCost extends StatefulWidget {
  const TotalCost({super.key});

  @override
  State<TotalCost> createState() => _TotalCostState();
}

int sum = 0;

class _TotalCostState extends State<TotalCost> {

  List<ledger> ledgerResponse = [];
  List<dynamic> ledger_name = [];

  @override
  Future<void> _getLedgerName() async {
    final String baseUrl = 'http://54.179.125.22:5000/ledger/get_ledgers_name';
    final int userid = uid;
    final String ledger_n = '';
    final String apiUrl = '$baseUrl?user_id=$userid';
    try {
      var response = await http.get(Uri.parse(apiUrl));
      print(userid);
      print(response.headers);
      if (response.statusCode == 200) {
        print('Response body: ${response.body}');
        ledger_name = jsonDecode(response.body);
        print(ledger_name[0][0]);
      } else {
        print("Failed to load data");
      }
    } catch (e) {
      print("Error: $e");
    }
  }

  @override
  Future<void> _fetchApiData() async {
    final String baseUrl = 'http://54.179.125.22:5000/data/get_ledger_datas';
    final int userid = uid;
    await _getLedgerName();
    final String ledger_n = ledger_name[0][0];
    //final String ledger_n = 'jeffery_ledger_2';
    print(ledger_n);
    final String apiUrl = '$baseUrl?user_id=$userid&ledger_name=$ledger_n';
    try {
      var response = await http.get(Uri.parse(apiUrl));
      if (response.statusCode == 200) {
        print('Server response: ${response.statusCode}');
        print('Response body: ${response.body}');
        List<dynamic> jsonResponse = jsonDecode(response.body);
        setState(() {
          ledgerResponse =
              jsonResponse.map((data) => ledger.fromJson(data)).toList();
          print('Decode Successfully');
        });
      } else {
        print("Failed to load data");
      }
    } catch (e) {
      print("Error: $e");
    }
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    _fetchApiData();
    super.didChangeDependencies();
    sum = costSum();
  }

  int costSum(){
    int sum = 0;
    for(int i = 0; i < ledgerResponse.length; i++){
      sum += ledgerResponse[i].price!.toInt();
    }
    return sum;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 600,
      alignment: Alignment.topCenter,
      child: Text(
        "\$" + costSum().toString(),
        style: TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.bold,
          fontStyle: FontStyle.italic
        ),
      ),
    );
  }
}
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:jimoney_frontend/DataBase/ledger.dart';
import 'package:jimoney_frontend/Register/presentation/login_page.dart';
import 'package:jimoney_frontend/AfterLogin/widgets/switch_ledger.dart';

class ListOutput extends StatefulWidget {
  const ListOutput({super.key});

  @override
  State<ListOutput> createState() => _ListOutputState();
}

class _ListOutputState extends State<ListOutput> {
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
  }

  final int sum = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          width: double.maxFinite,
          decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20), topRight: Radius.circular(20)),
              border: Border.all(color: Colors.grey)),
          child: //ledgerResponse != null
              ListView.builder(
            itemCount: ledgerResponse.length,
            itemBuilder: (context, index) {
              return Dismissible(
                key: UniqueKey(),
                direction: DismissDirection.endToStart,
                onDismissed: (direction) {
                  setState(
                    () {
                      ledgerResponse.removeAt(index);

                    },
                  );
                },
                background: Container(
                  color: Colors.red,
                  alignment: AlignmentDirectional.centerEnd,
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Icon(Icons.delete, color: Colors.white),
                ),
                child: Container(
                  color: Color(0XFFFFD9D9),
                  child: ListTile(
                    leading: CircleAvatar(
                      child: Icon(Icons.account_balance_wallet),
                    ),
                    title: Text(ledgerResponse[index].dname ?? 'No Name'),
                    subtitle: Text(ledgerResponse[index].ddate ?? 'No Date'),
                    trailing: Text(
                        ledgerResponse[index].price.toString() ?? 'No Amount'),
                    onTap: () {
                      print('You tapped on ${ledgerResponse![index].dname}');
                    },
                  ),
                ),
              );
            },
            scrollDirection: Axis.vertical,
          )
          //: Center(child: CircularProgressIndicator()),
          ),
    );
  }
}

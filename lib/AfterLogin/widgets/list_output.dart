import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:jimoney_frontend/DataBase/ledger.dart';

class ListOutput extends StatefulWidget {
  const ListOutput({super.key});

  @override
  State<ListOutput> createState() => _ListOutputState();
}

class _ListOutputState extends State<ListOutput> {
  List<ledger> ledgerResponse = [];

  @override
  Future<void> _fetchApiData() async {

    final String baseUrl = 'http://54.179.125.22:5000/data/get_ledger_datas';
    final int userid = 1;
    final String ledger_name = 'mason_ledger_1';
    final String apiUrl = '$baseUrl?user_id=$userid&ledger_name=$ledger_name';
    try {
      var response = await http.get(Uri.parse(apiUrl));
      if (response.statusCode == 200) {
        print('Server response: ${response.statusCode}');
        print('Response body: ${response.body}');
        List<dynamic> jsonResponse = jsonDecode(response.body);
        setState(() {
          ledgerResponse = jsonResponse.map((data) => ledger.fromJson(data)).toList();
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
            itemCount: ledgerResponse?.length,
            itemBuilder: (context, index) {
              return Container(
                color: Color(0XFFFFD9D9),
                child: ListTile(
                  leading: CircleAvatar(
                    child: Icon(Icons.account_balance_wallet),
                  ),
                  title: Text(ledgerResponse![index].dname ?? 'No Name'),
                  subtitle: Text(ledgerResponse![index].ddate ?? 'No Date'),
                  trailing: Text(ledgerResponse![index].price.toString() ?? 'No Amount'),
                  onTap: (){
                    print('You tapped on ${ledgerResponse![index].dname}');
                  
                  },
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

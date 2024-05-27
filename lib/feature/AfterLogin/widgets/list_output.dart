import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:jimoney_frontend/DataBase/costResponse.dart';

class ListOutput extends StatefulWidget {
  const ListOutput({super.key});

  @override
  State<ListOutput> createState() => _ListOutputState();
}

class _ListOutputState extends State<ListOutput> {
  CostResponse? costResponse;

  void _fetchApiData() async {
    var url = 'http://localhost:3000/data';
    try {
      var response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        print('Server error: ${response.statusCode}');
        print('Response body: ${response.body}');
        List<dynamic> jsonResponse = jsonDecode(response.body);
        print(jsonResponse);
        setState(() {
          costResponse = CostResponse.fromJson({"data": jsonResponse});
          print('Decode Successfully');
          print(costResponse!.data?[0].title);
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
        child: costResponse != null
            ? ListView.builder(
                itemCount: costResponse!.data?.length,
                itemBuilder: (context, index) {
                  return Container(
                    color: Color(0XFFFFD9D9), 
                    child: ListTile(
                      title: Text(costResponse!.data?[index].title ?? 'No Title'),
                      subtitle:
                          Text(costResponse!.data?[index].createdAt ?? 'No Date'),
                    ),
                  );
                },
                scrollDirection: Axis.vertical,
              )
            : Center(child: CircularProgressIndicator()),
      ),
    );
  }
}

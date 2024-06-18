import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:jimoney_frontend/ApiServices/updatedata.dart';
import 'package:jimoney_frontend/feature/common/user_info.dart';
import 'package:intl/intl.dart';

class FloatingActionButtonExample extends StatefulWidget {
  @override
  _FloatingActionButtonExampleState createState() =>
      _FloatingActionButtonExampleState();
}

class _FloatingActionButtonExampleState
    extends State<FloatingActionButtonExample> {
  Future<void> _insertData() async {
    final DataUpdateService dataUpdateService =
        GetIt.instance<DataUpdateService>();
    final UserInfo userInfo = GetIt.instance<UserInfo>();
    DateTime now = DateTime.now();
    String formattedDate = DateFormat('yyyyMMdd').format(now);
    print("Format" + formattedDate);
    print("Insert ledger:" + userInfo.selectedledger);
    try {
      dataUpdateService.insert_new_data(
          userInfo.uid!,
          userInfo.selectedledger,
          inputedDataPrice!,
          inputedDataName!,
          inputedDataCategory!,
          formattedDate);
      print("Inserting Success");
    } catch (e) {
      print("ERORR inserting data: $e");
    }
  }

  final _formKey = GlobalKey<FormState>();
  String? inputedDataName;
  int? inputedDataPrice;
  String? inputedDataCategory;

  void _showInputForm(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return Container(
          height: 450,
          width: 450,
          child: Padding(
            padding: EdgeInsets.only(
              bottom: 20,
              left: 20,
              right: 20,
              top: 20,
            ),
            child: Form(
              key: _formKey,
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextFormField(
                      decoration: InputDecoration(labelText: 'Data Name'),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter some text';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        inputedDataName = value;
                      },
                    ),
                    TextFormField(
                      decoration: InputDecoration(labelText: 'Price'),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter the price';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        inputedDataPrice = int.tryParse(value!);
                      },
                    ),
                    TextFormField(
                      decoration: InputDecoration(labelText: 'Category'),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter the Category';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        inputedDataCategory = value;
                      },
                    ),
                    ElevatedButton(
                      child: Text('Submit'),
                      onPressed: () {
                        if (_formKey.currentState?.validate() ?? false) {
                          _formKey.currentState?.save();
                          Navigator.pop(context);
                          _insertData();
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                                content: Text(
                                    'DataName: $inputedDataName, DataPrice: $inputedDataPrice, DataCategory: $inputedDataCategory')),
                          );
                        }
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55,
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add, color: Colors.white, size: 30),
          onPressed: () {
            showModalBottomSheet(
                isScrollControlled: true,
                context: context,
                builder: (context) {
                  return Container(
                    height: 200,
                    padding: const EdgeInsets.only(bottom: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        TextButton(
                            onPressed: () => _showInputForm(context),
                            child: Text(
                              "收入",
                              style: TextStyle(
                                color: Colors.green,
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                              ),
                            )),
                        TextButton(
                          onPressed: () => _showInputForm(context),
                          child: Text(
                            "支出",
                            style: TextStyle(
                              color: Colors.red,
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        )
                      ],
                    ),
                  );
                });
          },
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          backgroundColor: Color.fromARGB(255, 244, 138, 182),
        ),
      ),
    );
  }
}

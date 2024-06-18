import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:get_it/get_it.dart';
import 'package:jimoney_frontend/ApiServices/updatedata.dart';
import 'package:jimoney_frontend/feature/bloc/bloc/data_bloc.dart';
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
      BlocProvider.of<DataBloc>(context).add(DataInsertEvent());
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
                      initialValue: 'Data Name',
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
      child: SpeedDial(
        icon: Icons.add,
        activeIcon: Icons.close,
        backgroundColor: Color.fromARGB(255, 244, 138, 182),
        children: [
          SpeedDialChild(
            child: Icon(Icons.arrow_downward, color: Colors.white, size: 30),
            backgroundColor: Colors.red,
            label: '支出',
            onTap: () => _showInputForm(context),
          ),
          SpeedDialChild(
            child: Icon(Icons.arrow_upward, color: Colors.white, size: 30),
            backgroundColor: Colors.green,
            label: '收入',
            onTap: () => _showInputForm(context),
          ),
        ],
      ),
    );
  }
}

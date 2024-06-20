import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:get_it/get_it.dart';
import 'package:jimoney_frontend/ApiServices/fetchdata.dart';
import 'package:jimoney_frontend/ApiServices/updatedata.dart';
import 'package:jimoney_frontend/feature/AfterLogin/widgets/categorydialog.dart';
import 'package:jimoney_frontend/feature/AfterLogin/widgets/walletdialog.dart';
import 'package:jimoney_frontend/feature/bloc/bloc/data_bloc.dart';
import 'package:jimoney_frontend/feature/common/ledger.dart';
import 'package:jimoney_frontend/feature/common/user_info.dart';
import 'package:intl/intl.dart';
import 'package:jimoney_frontend/feature/common/wallet.dart';

class FloatingActionButtonExample extends StatefulWidget {
  @override
  _FloatingActionButtonExampleState createState() =>
      _FloatingActionButtonExampleState();
}

class _FloatingActionButtonExampleState
    extends State<FloatingActionButtonExample> {
  final UserInfo userInfo = GetIt.instance<UserInfo>();
  Future<void> _fetchDatas() async {
    //print("ERRORCHECCK1");
    final DataService dataService = GetIt.instance<DataService>();
    print("ERRORCHECKKLL2");
    print("userid:" + userInfo.uid.toString());
    print("userselectedledger:" + userInfo.selectedledger.toString());
    try {
      setState(() {
        userInfo.ledgerResponse = [];
      });
      // userInfo.ledgerResponse = (await dataService.fetchDatas(
      //     userInfo.uid!, userInfo.selectedledger))!;
      // BlocProvider.of<DataBloc>(context).add(DataFetchedEvent());
      // _sum();
      var fetchedData = await dataService.fetchDatas(userInfo.uid!);

      if (fetchedData != null && fetchedData.isNotEmpty) {
        setState(() {
          userInfo.ledgerResponse = fetchedData;
        });

        BlocProvider.of<DataBloc>(context).add(DataFetchedEvent());
      } else {
        print("No data fetched or empty data received.");
      }
      print("LedgerResponse");
      print(userInfo.ledgerResponse);
      // userId
      // Now you can use the userId as needed
    } catch (e) {
      print("Errorrrrr fetching ledger: $e");
      // return null;
    }
  }

  Future<void> _insertData() async {
    final DataUpdateService dataUpdateService =
        GetIt.instance<DataUpdateService>();
    final UserInfo userInfo = GetIt.instance<UserInfo>();
    final LedgerByWallet ledgerByWallet = GetIt.instance<LedgerByWallet>();
    DateTime now = DateTime.now();
    String formattedDate = DateFormat('yyyyMMdd').format(now);
    print("Format" + formattedDate);
    print("Insert ledger:" + userInfo.selectedledger);
    print("inputDataPrice:" + inputedDataPrice.toString());
    try {
      dataUpdateService.insert_new_data(
        userInfo.uid!,
        inputedDataPrice!,
        inputedDataName!,
        inputedDataCategory!,
        inputedDataDate!,
        ledgerByWallet.wid,
        ledgerByWallet.lid,
      );
      await _fetchDatas();
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
  String? inputedDataDate;
  String? inputedWallet;
  String? inputedLedger;

  TextEditingController dateController = TextEditingController();

  void _showInputForm(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return Container(
          height: 550, // Increased height to accommodate additional widgets
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
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Wallet: ${userInfo.inputedWallet}',
                            style: TextStyle(fontSize: 16),
                          ),
                          Text(
                            'Ledger: ${userInfo.inputedLedger}',
                            style: TextStyle(fontSize: 16),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        Container(
                          padding: EdgeInsets.all(8.0),
                          decoration: BoxDecoration(
                            color: Colors.pink, // Background color
                            shape: BoxShape.circle,
                          ),
                          child: IconButton(
                            icon: Icon(Icons.wallet_giftcard,
                                color: Colors.white),
                            onPressed: () {
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return WalletDialog(
                                    onCategorySelected: (Wallet wallet) {
                                      setState(() {
                                        userInfo.inputedWallet = wallet.name;
                                      });
                                    },
                                  );
                                },
                              );
                              // Open Ledger Selection Dialog
                            },
                          ),
                        ),
                        SizedBox(width: 10),
                        Expanded(
                          child: TextFormField(
                            decoration: InputDecoration(
                              labelText: 'Name of the purchase',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                borderSide: BorderSide(
                                  color: Colors.grey,
                                ),
                              ),
                              contentPadding:
                                  EdgeInsets.symmetric(horizontal: 20),
                            ),
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
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    Row(
                      children: [
                        Container(
                          padding: EdgeInsets.all(8.0),
                          decoration: BoxDecoration(
                            color: Colors.pink, // Background color
                            shape: BoxShape.circle,
                          ),
                          child: Icon(Icons.attach_money, color: Colors.white),
                        ),
                        SizedBox(width: 10),
                        Expanded(
                          child: TextFormField(
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              labelText: 'Price',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                borderSide: BorderSide(
                                  color: Colors.grey,
                                ),
                              ),
                              contentPadding:
                                  EdgeInsets.symmetric(horizontal: 20),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter the price';
                              }
                              return null;
                            },
                            onSaved: (value) {
                              inputedDataPrice = int.tryParse(value!)?.abs();
                            },
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    Row(
                      children: [
                        Container(
                          padding: EdgeInsets.all(8.0),
                          decoration: BoxDecoration(
                            color: Colors.pink, // Background color
                            shape: BoxShape.circle,
                          ),
                          child: IconButton(
                            icon: Icon(Icons.category, color: Colors.white),
                            onPressed: () {
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return CategoryDialog(
                                    onCategorySelected: (String category) {
                                      setState(() {
                                        inputedDataCategory = category;
                                      });
                                    },
                                  );
                                },
                              );
                            },
                          ),
                        ),
                        SizedBox(width: 10),
                        Expanded(
                          child: TextFormField(
                            controller: dateController,
                            decoration: InputDecoration(
                              labelText: 'YYYY/MM/DD',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                borderSide: BorderSide(
                                  color: Colors.grey,
                                ),
                              ),
                              contentPadding:
                                  EdgeInsets.symmetric(horizontal: 20),
                            ),
                            readOnly: true,
                            onTap: () async {
                              DateTime? pickedDate = await showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime(2000),
                                lastDate: DateTime(2101),
                              );
                              if (pickedDate != null) {
                                String formattedDate =
                                    DateFormat('yyyyMMdd').format(pickedDate);
                                setState(() {
                                  dateController.text = formattedDate;
                                  inputedDataDate = formattedDate;
                                });
                              }
                            },
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please select a date';
                              }
                              return null;
                            },
                            onSaved: (value) {
                              inputedDataDate = value;
                            },
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    ElevatedButton(
                      child: Padding(
                        padding: EdgeInsets.all(20.0), // 調整內邊距來增大按鈕
                        child: Text(
                          'Done',
                          style: TextStyle(
                              fontSize: 20.0, color: Colors.white), // 調整文字大小
                        ),
                      ),
                      onPressed: () {
                        if (_formKey.currentState?.validate() ?? false) {
                          _formKey.currentState?.save();
                          Navigator.pop(context);
                          _insertData();
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                'DataName: $inputedDataName, DataPrice: $inputedDataPrice, DataCategory: $inputedDataCategory, DataDate: $inputedDataDate',
                              ),
                            ),
                          );
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.pink,
                        shape: CircleBorder(),
                      ),
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

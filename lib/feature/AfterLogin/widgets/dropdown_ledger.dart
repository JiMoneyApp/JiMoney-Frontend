import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:jimoney_frontend/ApiServices/fetchdata.dart';
import 'package:jimoney_frontend/ApiServices/fetchledger.dart';
import 'package:jimoney_frontend/ApiServices/updateledger.dart';
import 'package:jimoney_frontend/feature/bloc/ledger_bloc.dart';
import 'package:jimoney_frontend/feature/common/user_info.dart';

class LedgerSelector extends StatefulWidget {
  const LedgerSelector({super.key});

  @override
  State<LedgerSelector> createState() => _LedgerSelectorState();
}

class _LedgerSelectorState extends State<LedgerSelector> {
  final UserInfo userInfo = GetIt.instance<UserInfo>();
  bool isLoading = true;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _fetchLedger();
  }

  Future<void> _fetchDatas() async {
    //print("ERRORCHECCK1");
    final DataService dataService = GetIt.instance<DataService>();
    print("ERRORCHECKK2");
    try {
      userInfo.ledgerResponse = (await dataService.fetchDatas(
          userInfo.uid!, userInfo.selectedledger))!;

      print(userInfo.ledgerResponse);
      // userId
      // Now you can use the userId as needed
    } catch (e) {
      print("Error fetching ledger: $e");
      // return null;
    }
  }

  Future<void> _fetchLedger() async {
    //print("ERRORCHECCK1");
    isLoading = true;
    final ledgerService = GetIt.instance<LedgerService>();
    //print("ERRORCHECKK2");
    try {
      userInfo.ledger = (await ledgerService.fetchLedgersName(userInfo.uid!))!;
      print("selected Ledger = " + userInfo.selectedledger);
      // userId
      // Now you can use the userId as needed
    } catch (e) {
      isLoading = false;
      print("Error fetching ledger: $e");
      // return null;
    }
  }

  Future<void> _insertLedger(String ledger_name) async {
    //print("ERRORCHECCK1");
    final ledgerService = GetIt.instance<LedgerUpdateService>();
    //print("ERRORCHECKK2");
    try {
      await ledgerService.insertLedger(userInfo.uid!, ledger_name);
      await _fetchLedger();
      BlocProvider.of<LedgerBloc>(context).add(LedgerAddedEvent());
      print("Inserting ledger: $ledger_name");

      // userId
      // Now you can use the userId as needed
    } catch (e) {
      print("Error inserting ledger: $e");
      // return null;
    }
  }

  void _showAddLedgerDialog(BuildContext context) {
    final TextEditingController _ledgerController = TextEditingController();
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Add New Ledger'),
            content: TextFormField(
              controller: _ledgerController,
              decoration: InputDecoration(hintText: 'Enter ledger name'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Ledger name cannot be empty';
                }
                return null;
              },
            ),
            actions: [
              ElevatedButton(
                onPressed: () {
                  if (_ledgerController.text.isNotEmpty) {
                    //print("Inserting ledger: ${_ledgerController.text}");
                    //_insertLedger(_ledgerController.text);
                    setState(() {
                      print("Inserting ledger: ${_ledgerController.text}");
                      _insertLedger(_ledgerController.text);
                    });

                    Navigator.of(context).pop();
                    print("Pop");
                  } else {
                    print("NOt even close");
                    Navigator.of(context).pop();
                  }
                },
                child: Text('Add'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('Cancel'),
              ),
            ],
          );
        });
  }

  void _onLedgerChanged(String? newLedger) {
    if (newLedger == 'add_new') {
      _showAddLedgerDialog(context);
    } else {
      print("Y");
      BlocProvider.of<LedgerBloc>(context).add(LedgerSelectedEvent(newLedger!));
    }
    // Add your logic here to handle ledger switch
    print("Switched to ledger: $newLedger");
    print("The new ledger is: ${userInfo.selectedledger}");
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _fetchLedger();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: FutureBuilder<void>(
        future: _fetchLedger(),
        builder: (BuildContext context, AsyncSnapshot<void> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator();
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else {
            return BlocBuilder<LedgerBloc, LedgerState>(
              builder: (context, state) {
                print("selectedLLL" + userInfo.selectedledger);
                return DropdownButton<String>(
                  value: state is LedgerInitial
                      ? userInfo.selectedledger = userInfo.ledger[0]
                      : userInfo.selectedledger,
                  hint: Text('Select Ledger'),
                  icon: Icon(Icons.arrow_drop_down),
                  iconSize: 24,
                  elevation: 16,
                  style: TextStyle(color: Colors.black),
                  underline: Container(
                    height: 2,
                    color: Colors.grey,
                  ),
                  onChanged: _onLedgerChanged,
                  items: [
                    DropdownMenuItem<String>(
                      value: 'add_new',
                      child: Text('Add New Ledger'),
                    ),
                    ...userInfo.ledger.map((String ledger) {
                      return DropdownMenuItem<String>(
                        value: ledger,
                        child: Text(ledger),
                      );
                    }).toList()
                  ],
                );
              },
            );
          }
        },
      ),
    );
  }
}

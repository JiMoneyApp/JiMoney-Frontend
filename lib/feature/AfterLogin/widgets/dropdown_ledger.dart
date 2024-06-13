import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:jimoney_frontend/ApiServices/fetchledger.dart';
import 'package:jimoney_frontend/ApiServices/fetchuser.dart';
import 'package:jimoney_frontend/DataBase/ledger.dart';
import 'package:jimoney_frontend/feature/common/user_info.dart';

class LedgerSelector extends StatefulWidget {
  const LedgerSelector({super.key});

  @override
  State<LedgerSelector> createState() => _LedgerSelectorState();
}

class _LedgerSelectorState extends State<LedgerSelector> {
  final UserInfo userInfo = GetIt.instance<UserInfo>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _fetchLedger();
  }

  int? userId = null;
  Future<void> _fetchUserId() async {
    final UserService userService = GetIt.instance<UserService>();
    try {
      userId =
          await userService.fetchUserId(userInfo.username, userInfo.password);
      print("userID = " + userId.toString());
      // userId;
      // Now you can use the userId as needed
    } catch (e) {
      print("Error fetching user ID: $e");
      // return null;
    }
  }

  Future<void> _fetchLedger() async {
    //print("ERRORCHECCK1");
    final ledgerService = GetIt.instance<LedgerService>();
    //print("ERRORCHECKK2");
    try {
      if (userId == null) {
        await _fetchUserId();
      }
      print("ERRORCHECKK1");
      userInfo.ledger = (await ledgerService.fetchLedgersName(userId!))!;
      print("ERRORCHECKK2");
      userInfo.selectedledger = userInfo.ledger[0];
      print(userInfo.selectedledger);
      // userId
      // Now you can use the userId as needed
    } catch (e) {
      print("Error fetching ledger: $e");
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
                    setState(() {
                      
                    });
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
      setState(() {
        userInfo.selectedledger = newLedger!;
      });
    }

    // Add your logic here to handle ledger switch
    print("Switched to ledger: $newLedger");
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: userInfo.selectedledger,
      icon: Icon(Icons.arrow_drop_down),
      iconSize: 24,
      elevation: 16,
      style: TextStyle(color: Colors.black),
      underline: Container(
        height: 2,
        color: Colors.grey,
      ),
      onChanged: _onLedgerChanged,
      items: userInfo.ledger.map<DropdownMenuItem<String>>((String ledger) {
        return DropdownMenuItem<String>(
          value: ledger,
          child: Text(ledger),
        );
      }).toList()
        ..add(
          DropdownMenuItem<String>(
            value: 'add_new',
            child: Text('Add New Ledger'),
          ),
        ),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:jimoney_frontend/ApiServices/fetchuser.dart';
import 'package:jimoney_frontend/ApiServices/updateledger.dart';
import 'package:jimoney_frontend/feature/common/user_info.dart';

class LedgerDeleteButton extends StatefulWidget {
  const LedgerDeleteButton({super.key});

  @override
  State<LedgerDeleteButton> createState() => _LedgerDeleteButtonState();
}

class _LedgerDeleteButtonState extends State<LedgerDeleteButton> {
  final UserInfo userInfo = GetIt.instance<UserInfo>();

  int? userId;
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

  Future<void> _deleteLedger(String ledger_name) async {
    //print("ERRORCHECCK1");
    if (userId == null) {
      await _fetchUserId();
    }
    final ledgerService = GetIt.instance<LedgerUpdateService>();
    //print("ERRORCHECKK2");
    try {
      ledgerService.deleteLedger(userId!, ledger_name);
      print("Inserting ledger: $ledger_name");
      // userId
      // Now you can use the userId as needed
    } catch (e) {
      print("Error deleting ledger: $e");
      // return null;
    }
  }

  Future<void> _confirmDelete(String ledgerName) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: true, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Confirm Delete'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('Are you sure you want to delete $ledgerName?'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('Delete'),
              onPressed: () {
                _deleteLedger(ledgerName);
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
  
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        _confirmDelete(userInfo.selectedledger);
      },
      child: Text("Delete Ledger", style: TextStyle(fontSize: 12), textAlign: TextAlign.center,),
    );
  }
}

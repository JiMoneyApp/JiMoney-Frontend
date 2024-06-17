import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:jimoney_frontend/ApiServices/fetchledger.dart';
import 'package:jimoney_frontend/ApiServices/fetchuser.dart';
import 'package:jimoney_frontend/ApiServices/updateledger.dart';
import 'package:jimoney_frontend/feature/common/user_info.dart';

import '../../bloc/ledger_bloc.dart';

class LedgerDeleteButton extends StatefulWidget {
  const LedgerDeleteButton({super.key});

  @override
  State<LedgerDeleteButton> createState() => _LedgerDeleteButtonState();
}

class _LedgerDeleteButtonState extends State<LedgerDeleteButton> {
  final UserInfo userInfo = GetIt.instance<UserInfo>();
  bool isLoading = true;

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

  Future<void> _deleteLedger(String ledger_name) async {
    //print("ERRORCHECCK1");
    final ledgerService = GetIt.instance<LedgerUpdateService>();
    //print("ERRORCHECKK2");
    try {
      await ledgerService.deleteLedger(userInfo.uid!, ledger_name);
      await _fetchLedger();
      print("Deleting ledger: $ledger_name");
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
      builder: (dialog_context) {
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
                setState(() {
                  BlocProvider.of<LedgerBloc>(context)
                      .add(LedgerDeletedEvent(ledgerName));
                  _deleteLedger(ledgerName);
                });
                // BlocProvider.of<LedgerBloc>(context)
                //     .add(LedgerDeletedEvent(ledgerName));
                // _deleteLedger(ledgerName);
                //_deleteLedger(ledgerName);
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
    return Builder(builder: (context) {
      return ElevatedButton(
        onPressed: () {
          _confirmDelete(userInfo.selectedledger);
        },
        child: Text(
          "Delete Ledger",
          style: TextStyle(fontSize: 12),
          textAlign: TextAlign.center,
        ),
      );
    });
  }
}

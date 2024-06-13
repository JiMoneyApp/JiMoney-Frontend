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

  void _onLedgerChanged(String? newLedger) {
    setState(() {
      userInfo.selectedledger = newLedger!;
    });

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
      }).toList(),
    );
  }
}

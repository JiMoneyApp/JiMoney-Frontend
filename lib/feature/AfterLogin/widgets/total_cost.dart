import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';
import 'package:jimoney_frontend/ApiServices/fetchledger.dart';
import 'package:jimoney_frontend/ApiServices/fetchuser.dart';
import 'package:jimoney_frontend/feature/common/user_info.dart';

class TotalCost extends StatefulWidget {
  const TotalCost({super.key});

  @override
  State<TotalCost> createState() => _TotalCostState();
}

class _TotalCostState extends State<TotalCost> {
  final UserInfo userInfo = GetIt.instance<UserInfo>();

  Future<void> _fetchCost() async {
    //print("ERRORCHECCK1");
    final LedgerService ledgerService = GetIt.instance<LedgerService>();
    print("ERRORCHECKK4");
    try {
      setState(() {});

      userInfo.sum = (await ledgerService.fetchLedgersSum(
          userInfo.uid!, userInfo.selectedledger))!;

      print("SUM = " + userInfo.sum.toString());
      // userId
      // Now you can use the userId as needed
    } catch (e) {
      print("Error fetching ledger: $e");
      // return null;
    }
  }

  @override
  void initState() {
    super.initState();
    _fetchCost();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Text(userInfo.sum.toString(),
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
      alignment: Alignment.center,
    );
  }
}

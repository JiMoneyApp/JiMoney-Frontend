import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';
import 'package:jimoney_frontend/feature/common/user_info.dart';

class BudgetDisplay extends StatefulWidget {
  const BudgetDisplay({super.key});

  @override
  State<BudgetDisplay> createState() => _BudgetDisplayState();
}

class _BudgetDisplayState extends State<BudgetDisplay> {
  final UserInfo userInfo = GetIt.instance<UserInfo>();
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Text(userInfo.budget.toString(), style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
    );
  }
}
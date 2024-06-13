import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';
import 'package:jimoney_frontend/feature/common/user_info.dart';

class TotalCost extends StatefulWidget {
  const TotalCost({super.key});

  @override
  State<TotalCost> createState() => _TotalCostState();
}

class _TotalCostState extends State<TotalCost> {
  final UserInfo userInfo = GetIt.instance<UserInfo>();
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Text(userInfo.sum.toString(), style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
      alignment: Alignment.center,
    );
  }
}
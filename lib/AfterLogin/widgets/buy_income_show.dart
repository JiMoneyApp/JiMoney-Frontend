import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BuyIncomeShow extends StatefulWidget {
  const BuyIncomeShow({super.key});

  @override
  State<BuyIncomeShow> createState() => _BuyIncomeShowState();
}

class _BuyIncomeShowState extends State<BuyIncomeShow> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey)
      ),
      padding: EdgeInsets.only(top: 10, bottom: 10),
      alignment: Alignment.center,
      child: Text(
        "MONEY",
        style: TextStyle(fontSize: 25),
      ),
    );
  }
}
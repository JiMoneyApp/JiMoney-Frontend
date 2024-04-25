import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:jimoney_frontend/AfterLogin/widgets/buy_income_show.dart';
import 'package:jimoney_frontend/AfterLogin/widgets/buy_income_switch.dart';
import 'package:jimoney_frontend/AfterLogin/widgets/date_button.dart';
import 'package:jimoney_frontend/AfterLogin/widgets/encouragement.dart';
import 'package:jimoney_frontend/AfterLogin/widgets/list_output.dart';
import 'package:jimoney_frontend/AfterLogin/widgets/monthly_total_balance.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  static String path = "/home";

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.maxFinite,
      child: Scaffold(
        body: Column(
          children: <Widget>[
            Container(
              width: double.infinity,
              child: Encouragement(),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 130, 10),
              child: Text(
                "Monthly Total Balance",
                style: TextStyle(
                    fontSize: 16, color: Colors.grey.withOpacity(0.97)),
              ),
            ),
            Container(
              width: double.infinity,
              child: MonthlyTotalBalance(),
            ),
            Row(
              children: [
                Container(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(30, 20, 0, 0),
                    child: BuyIncomeSwitch(),
                  ),
                ),
                Container(
                  child: DateButton(),
                )
              ],
            ),
            Container(
              width: 200,
              padding: EdgeInsets.only(top: 15),
              child: BuyIncomeShow(),
            ),
            Container(
              height: 349,
              padding: EdgeInsets.only(top: 15),
              child: ListOutput(),
            )
          ],
        ),
        bottomNavigationBar: BottomAppBar(
            child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              child: IconButton(onPressed: () {}, icon: Icon(Icons.home)),
              width: 120,
            ),
            SizedBox(
              child: IconButton(onPressed: () {}, icon: Icon(Icons.analytics)),
              width: 120,
            ),
            SizedBox(
                child: IconButton(onPressed: () {}, icon: Icon(Icons.settings)),
                width: 120),
          ],
        )),
      ),
    );
  }
}

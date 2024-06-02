import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:jimoney_frontend/AfterLogin/widgets/buy_income_show.dart';
import 'package:jimoney_frontend/AfterLogin/widgets/buy_income_switch.dart';
import 'package:jimoney_frontend/AfterLogin/widgets/date_button.dart';
import 'package:jimoney_frontend/AfterLogin/widgets/encouragement.dart';
import 'package:jimoney_frontend/AfterLogin/widgets/list_output.dart';
import 'package:jimoney_frontend/AfterLogin/widgets/monthly_total_balance.dart';
import 'package:jimoney_frontend/Register/presentation/login_page.dart';
import 'package:jimoney_frontend/AfterLogin/widgets/floating_action_button.dart';

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
        body: Container(
          color: Color(0XFFFFD9D9),
          child: Column(
            children: <Widget>[
              Container(
                width: double.infinity,
                child: Encouragement(),
              ),
              Container(
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.only(left: 30, bottom: 10),
                  child: Text(
                    "Monthly Total Balance",
                    style: TextStyle(
                        fontSize: 16, color: Colors.grey.withOpacity(0.97)),
                  ),
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
                    width: 180,
                    height: 50,
                    padding: EdgeInsets.only(left: 20, top: 10),
                    child: DateButton(),
                  )
                ],
              ),
              Container(
                color: Color(0XFFFFD9D9),
                width: 200,
                padding: EdgeInsets.only(top: 15),
                child: BuyIncomeShow(),
              ),
              Container(
                height: 349,
                padding: EdgeInsets.only(top: 15),
                child: ListOutput(),
              ),
            ],
          ),
        ),
        bottomNavigationBar: BottomAppBar(
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                child: IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.home, color: Color(0XFFF84490))),
                width: 120,
              ),
              SizedBox(
                child: IconButton(
                    onPressed: () async {
                      context.go("/analytics");
                    },
                    icon: Icon(
                      Icons.analytics,
                      color: Color(0XFFF84490),
                    )),
                width: 120,
              ),
              SizedBox(
                  child: IconButton(
                      onPressed: () async {
                        context.go("/settings");
                      },
                      icon: Icon(Icons.settings, color: Color(0XFFF84490))),
                  width: 120),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButtonExample(),
      ),
    );
  }
}

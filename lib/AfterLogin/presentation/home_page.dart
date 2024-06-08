import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:jimoney_frontend/AfterLogin/widgets/budget_slider.dart';
import 'package:jimoney_frontend/AfterLogin/widgets/buy_income_show.dart';
import 'package:jimoney_frontend/AfterLogin/widgets/buy_income_switch.dart';
import 'package:jimoney_frontend/AfterLogin/widgets/date_button.dart';
import 'package:jimoney_frontend/AfterLogin/widgets/encouragement.dart';
import 'package:jimoney_frontend/AfterLogin/widgets/list_output.dart';
import 'package:jimoney_frontend/AfterLogin/widgets/switch_ledger.dart';
import 'package:jimoney_frontend/AfterLogin/widgets/total_cost.dart';
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


  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.maxFinite,
      child: Scaffold(
        body: Container(
          color: Color(0XFFFFD9D9),
          child: Column(
            children: <Widget>[
              // Encouragement
              Container(
                width: double.infinity,
                child: Encouragement(),
              ),
              // Monthly Total Balance
              Container(
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.only(left: 30),
                  child: Text(
                    "Cost:",
                    style: TextStyle(
                        fontSize: 30, color: Colors.white, fontWeight: FontWeight.bold, fontStyle: FontStyle.italic),
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                child: TotalCost(),
              ),
              Container(
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.only(left: 30, bottom: 5),
                  child: Text(
                    "Budget:",
                    style: TextStyle(
                        fontSize: 30, color: Colors.white, fontWeight: FontWeight.bold, fontStyle: FontStyle.italic),
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                child: BudgetSlider()
              ),
              Container(
                width: double.infinity,
                height: 40,
                child: SwitchLedger(),
              ),
              Container(
                height: 320,
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

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:jimoney_frontend/ApiServices/fetchledger.dart';
import 'package:jimoney_frontend/feature/AfterLogin/widgets/buy_income_switch.dart';
import 'package:jimoney_frontend/feature/AfterLogin/widgets/date_button.dart';
import 'package:jimoney_frontend/feature/AfterLogin/widgets/dropdown_ledger.dart';
import 'package:jimoney_frontend/feature/AfterLogin/widgets/encouragement.dart';
import 'package:jimoney_frontend/feature/AfterLogin/widgets/floating_action_button.dart';
import 'package:jimoney_frontend/feature/AfterLogin/widgets/total_cost.dart';
import 'package:jimoney_frontend/feature/common/user_info.dart';

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
                    "Cost:",
                    style: TextStyle(
                        fontSize: 30,
                        color: Colors.white,
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.bold,
                    ),
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
                  padding: const EdgeInsets.only(left: 30, bottom: 10),
                  child: Text(
                    "Budget:",
                    style: TextStyle(
                        fontSize: 30,
                        color: Colors.white,
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                child: TotalCost(),
              ),
              Container(
                  color: Color(0XFFFFD9D9),
                  width: 200,
                  height: 50,
                  padding: EdgeInsets.only(top: 15),
                  child: LedgerSelector()),
              Container(
                
              )
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

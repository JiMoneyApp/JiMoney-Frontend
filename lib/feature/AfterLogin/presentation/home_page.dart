import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jimoney_frontend/feature/AfterLogin/widgets/budget_display.dart';
import 'package:jimoney_frontend/feature/AfterLogin/widgets/dropdown_ledger.dart';
import 'package:jimoney_frontend/feature/AfterLogin/widgets/encouragement.dart';
import 'package:jimoney_frontend/feature/AfterLogin/widgets/floating_action_button.dart';
import 'package:jimoney_frontend/feature/AfterLogin/widgets/ledger_delete_button.dart';
import 'package:jimoney_frontend/feature/AfterLogin/widgets/list_output.dart';
import 'package:jimoney_frontend/feature/AfterLogin/widgets/total_cost.dart';
import 'package:jimoney_frontend/routing/bloc/bottom_navigation_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BottomNavigationBloc, BottomNavigationState>(
      builder: (context, state) {
        return Container(
          height: double.maxFinite,
          child: Scaffold(
            body: BlocBuilder<BottomNavigationBloc, BottomNavigationState>(
              builder: (context, state) {
                return Container(
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
                        child: BudgetDisplay(),
                      ),
                      Row(
                        children: [
                          Container(
                              color: Color(0XFFFFD9D9),
                              width: 250,
                              height: 60,
                              padding: EdgeInsets.only(top: 15),
                              child: LedgerSelector()),
                          Container(
                            width: 100,
                            height: 50,
                            child: LedgerDeleteButton(),
                          )
                        ],
                      ),
                      Container(
                        height: 320,
                        width: double.infinity,
                        child: ListOutput(),
                      )
                    ],
                  ),
                );
              },
            ),
            floatingActionButton: FloatingActionButtonExample(),
          ),
        );
      },
    );
  }
}

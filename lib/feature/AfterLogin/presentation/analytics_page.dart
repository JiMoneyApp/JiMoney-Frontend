import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jimoney_frontend/feature/AfterLogin/widgets/buy_income_switch.dart';
import 'package:jimoney_frontend/feature/AfterLogin/widgets/day_month_year_switch.dart';
import 'package:jimoney_frontend/feature/AfterLogin/widgets/pie_chart.dart';
import 'package:jimoney_frontend/routing/bloc/bottom_navigation_bloc.dart';

class AnalyticsPage extends StatefulWidget {
  const AnalyticsPage({super.key});

  @override
  State<AnalyticsPage> createState() => _AnalyticsPageState();
}

class _AnalyticsPageState extends State<AnalyticsPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.maxFinite,
      child: Scaffold(
        body: BlocBuilder<BottomNavigationBloc, BottomNavigationState>(
          builder: (context, state) {
            return Column(
              children: [
                Container(
                  padding: EdgeInsets.only(top: 80, bottom: 10),
                  child: DayMonthYearSwitch(),
                ),
                Container(
                  height: 300,
                  padding: EdgeInsets.only(bottom: 10),
                  child: PieChart(),
                ),
                Container(
                  child: BuyIncomeSwitch(),
                )
              ],
            );
          },
        ),
      ),
    );
  }
}

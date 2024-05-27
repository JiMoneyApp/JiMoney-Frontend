import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:jimoney_frontend/AfterLogin/presentation/home_page.dart';
import 'package:jimoney_frontend/AfterLogin/widgets/buy_income_switch.dart';
import 'package:jimoney_frontend/AfterLogin/widgets/circle_chart.dart';
import 'package:jimoney_frontend/AfterLogin/widgets/day_month_year_switch.dart';
import 'package:jimoney_frontend/AfterLogin/widgets/pie_chart.dart';

class AnalyticsPage extends StatefulWidget {
  const AnalyticsPage({super.key});

  static String path = "/analytics";

  @override
  State<AnalyticsPage> createState() => _AnalyticsPageState();
}

class _AnalyticsPageState extends State<AnalyticsPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.maxFinite,
      child: Scaffold(
        body: Column(
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
        ),
        bottomNavigationBar: BottomAppBar(
            child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              child: IconButton(onPressed: () async{context.go("/home");}, icon: Icon(Icons.home)),
              width: 120,
            ),
            SizedBox(
              child: IconButton(onPressed: () {}, icon: Icon(Icons.analytics)),
              width: 120,
            ),
            SizedBox(
                child: IconButton(onPressed: () async{context.go("/settings");}, icon: Icon(Icons.settings)),
                width: 120),
          ],
        )),
      ),
    );
  }
}
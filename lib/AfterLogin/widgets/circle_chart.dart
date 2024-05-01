import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';

class CircleChart extends StatefulWidget {
  const CircleChart({super.key});

  @override
  State<CircleChart> createState() => _CircleChartState();
}
class _PieData {
  _PieData(this.xData, this.yData, [this.text]);
  final String xData;
  final num yData;
  String? text;
}

class _CircleChartState extends State<CircleChart> {
  @override
  Widget build(BuildContext context) {
 return Center(
    child:SfCircularChart(
    title: ChartTitle(text: 'Total Expeneses'),
    legend: Legend(isVisible: true),
    series: <PieSeries<_PieData, String>>[
      PieSeries<_PieData, String>(
        explode: true,
        explodeIndex: 0,
       
        xValueMapper: (_PieData data, _) => data.xData,
        yValueMapper: (_PieData data, _) => data.yData,
        dataLabelMapper: (_PieData data, _) => data.text,
        dataLabelSettings: DataLabelSettings(isVisible: true)),
   ]
  )
 );
}


}
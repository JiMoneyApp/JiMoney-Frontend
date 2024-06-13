import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:jimoney_frontend/DataBase/ledger.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class PieChart extends StatefulWidget {
  const PieChart({super.key});

  @override
  State<PieChart> createState() => _PieChartState();
}

class _PieChartState extends State<PieChart> {
  @override
  Widget build(BuildContext context) {
    final List<ChartData> chartData = [
      ChartData('David', 25, Colors.red),
      ChartData('Steve', 38, Colors.yellow),
      ChartData('Jack', 34, Colors.green),
      ChartData('Others', 52, Colors.blue)
    ];

    return Scaffold(
      body: Center(
        child: Container(
          child: SfCircularChart(
            title: ChartTitle(text: 'Pie Chart Test'),
            series: <CircularSeries>[
              // Render pie chart
              PieSeries<ChartData, String>(
                dataSource: chartData,
                pointColorMapper: (ChartData data, _) => data.color,
                xValueMapper: (ChartData data, _) => data.x,
                yValueMapper: (ChartData data, _) => data.y,
                dataLabelMapper: (ChartData data, _) => data.x,
                dataLabelSettings: DataLabelSettings(
                    isVisible: true,
                    labelPosition: ChartDataLabelPosition.outside),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ChartData {
  ChartData(this.x, this.y, [this.color]);
  final String x;
  final double y;
  final Color? color;
}

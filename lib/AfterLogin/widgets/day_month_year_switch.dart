import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:toggle_switch/toggle_switch.dart';

class DayMonthYearSwitch extends StatelessWidget {
  const DayMonthYearSwitch({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ToggleSwitch(
        minHeight: 40,
        minWidth: 70,
        initialLabelIndex: 0,
        cornerRadius: 10.0,
        activeFgColor: Colors.black,
        inactiveBgColor: const Color.fromARGB(178, 255, 255, 255),
        inactiveFgColor: Colors.black,
        totalSwitches: 3,
        labels: ['Day', 'Month', 'Year'],
        activeBgColors: [
          [Colors.grey],
          [Colors.grey],
          [Colors.grey]
        ],
        onToggle: (index) {
          print('switched to: $index');
        },
      ),
    );
  }
}
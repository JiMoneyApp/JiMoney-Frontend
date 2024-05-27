import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:toggle_switch/toggle_switch.dart';

class BuyIncomeSwitch extends StatelessWidget {
  const BuyIncomeSwitch({super.key});

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
        totalSwitches: 2,
        labels: ['Buy', 'Income'],
        activeBgColors: [
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

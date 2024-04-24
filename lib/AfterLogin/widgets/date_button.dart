import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DateButton extends StatefulWidget {
  const DateButton({super.key});

  @override
  State<DateButton> createState() => _DateButtonState();
}

class _DateButtonState extends State<DateButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(70, 15, 0, 0),
      child: ElevatedButton(
        onPressed: (){},
        child: Text(
          "Date"
        )
      )
    );
  }
}
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DateButton extends StatefulWidget {
  const DateButton({super.key});

  @override
  State<DateButton> createState() => _DateButtonState();
}

class _DateButtonState extends State<DateButton> {

  DateTime now = DateTime.now();
  String? date;

  @override
  void initState() {
    super.initState();
    date = '${now.year}-${now.month}-${now.day}';
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ElevatedButton(
        onPressed: () async{
          dynamic result = await showDatePicker(
            context: context,
            firstDate: DateTime(2023, 01),
            lastDate: DateTime(2100, 12),
            initialDate: DateTime.now(),
          );
          if (result != null) {
            setState(() {
              date = '${result.year}/${result.month}/${result.day}';
            });
          }
          print(date); 
        },
        child: Text(
          date ?? DateTime.now().toString(),
        )
      )
    );
  }
}
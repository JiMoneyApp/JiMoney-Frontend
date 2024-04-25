import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ListOutput extends StatelessWidget {
  const ListOutput({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20)),
        border: Border.all(color: Colors.grey)
      ),
      child: ListView(
        scrollDirection: Axis.vertical,
        children: <Widget>[
          Center(
            child: Text(
              "11"
            ),
          )
        ],
      ),
    );
  }
}
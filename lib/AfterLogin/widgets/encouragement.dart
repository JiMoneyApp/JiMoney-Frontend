import 'package:flutter/cupertino.dart';
import 'dart:math';
import 'package:flutter/material.dart';

class Encouragement extends StatelessWidget {
  const Encouragement({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 165,
      width: 600,
      alignment: Alignment.center,
      padding: EdgeInsets.fromLTRB(30, 60, 30, 0),
      child: Text(
        lines[Random().nextInt(4)],
        style: TextStyle(color: Colors.black, fontSize: 22,),
        textAlign: TextAlign.center,
        textDirection: TextDirection.ltr,
      ),
    );
  }
}

List<String> lines = [
  "今天過得還好嗎？",
  "今天過得充實嗎？",
  "與你相遇的過程，\n是我一生中最快樂的時光。",
  "在這個世界上總有一個人是等著你的，不管在什麼時候、什麼地方，總有這麼個人。",
  "也許愛不是熱情，也不是懷念，不過是歲月，年深月久成了生活的一部分。",
];
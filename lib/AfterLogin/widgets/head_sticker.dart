import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HeadSticker extends StatefulWidget {
  const HeadSticker({super.key});

  @override
  State<HeadSticker> createState() => _HeadStickerState();
}

class _HeadStickerState extends State<HeadSticker> {

  @override
  Widget build(BuildContext context) {
    final url = '/Users/kenny/Desktop/app/JiMoney-Frontend/lib/assets/logo.png';

    return Container(
      width: 100,
      height: 100,
      child: CircleAvatar(
        backgroundImage: AssetImage(url),
      ),
    );
  }
}
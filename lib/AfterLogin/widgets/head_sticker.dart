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
    final url = 'https://scontent-tpe1-1.xx.fbcdn.net/v/t39.30808-6/279764364_1342957779519825_8715237538739757452_n.jpg?_nc_cat=110&ccb=1-7&_nc_sid=5f2048&_nc_ohc=mMFaqeqbiuEQ7kNvgFecelJ&_nc_ht=scontent-tpe1-1.xx&oh=00_AYAOufAlYd6853IgMILtUMw-hfi_5y1tZ_OQ5dZDr5Y3CQ&oe=66521FC0';

    return Container(
      width: 100,
      height: 100,
      child: CircleAvatar(
        backgroundImage: NetworkImage(url),
      ),
    );
  }
}
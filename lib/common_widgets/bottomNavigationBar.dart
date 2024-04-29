import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BottomNavigation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            width: 120,
            child: IconButton(
              onPressed: () {
                context.pushReplacement('/home');
              },
              icon: Icon(Icons.home),
            ),
          ),
          SizedBox(
            width: 120,
            child: IconButton(
              onPressed: () {
                context.pushReplacement('/statistics');
              },
              icon: Icon(Icons.analytics),
            ),
          ),
          SizedBox(
            width: 120,
            child: IconButton(
              onPressed: () {
                context.pushReplacement('/settings');
              },
              icon: Icon(Icons.settings),
            ),
          ),
        ],
      ),
    );
  }
}

enum RootPage {
  home("home"),
  statistics("statistics"),
  settings("settings");

  final String display;
  final String unselectedImage, selectedImage;
  const RootPage(this.display,
      {this.unselectedImage = '', this.selectedImage = ''});
}

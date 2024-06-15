import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:jimoney_frontend/routing/bloc/bottom_navigation_bloc.dart';

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
                print("onH");
                BlocProvider.of<BottomNavigationBloc>(context)
                    .add(NavigateToHomeEvent());
                //Navigator.of(context).pushReplacementNamed('/home');
              },
              icon: Icon(
                Icons.home,
              ),
            ),
          ),
          SizedBox(
            width: 120,
            child: IconButton(
              onPressed: () {
                print("onA");
                BlocProvider.of<BottomNavigationBloc>(context)
                    .add(NavigateToAnalyticsEvent());
                //Navigator.of(context).pushReplacementNamed('/analytics');
              },
              icon: Icon(Icons.analytics),
            ),
          ),
          SizedBox(
            width: 120,
            child: IconButton(
              onPressed: () {
                print("onS");
                BlocProvider.of<BottomNavigationBloc>(context)
                    .add(NavigateToSettingsEvent());
                // Navigator.of(context).pushReplacementNamed('/settings');
              },
              icon: Icon(Icons.settings),
            ),
          ),
        ],
      ),
    );
  }
}

// enum RootPage {
//   home("home"),
//   statistics("statistics"),
//   settings("settings");

//   final String display;
//   final String unselectedImage, selectedImage;
//   const RootPage(this.display,
//       {this.unselectedImage = '', this.selectedImage = ''});
// }

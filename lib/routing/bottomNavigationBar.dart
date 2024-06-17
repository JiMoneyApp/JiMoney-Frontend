import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
            width: 180,
            child: BlocBuilder<BottomNavigationBloc, BottomNavigationState>(
              builder: (context, state) {
                return IconButton(
                  color: state is HomeScreenState
                      ? Color(0XFFF84490)
                      : Colors.black,
                  onPressed: () {
                    print("onH");
                    BlocProvider.of<BottomNavigationBloc>(context)
                        .add(NavigateToHomeEvent());
                    //Navigator.of(context).pushReplacementNamed('/home');
                  },
                  icon: Column(
                    children: [
                      Icon(
                        Icons.home,
                      ),
                      // Text("Home"),
                    ],
                  ),
                );
              },
            ),
          ),
          SizedBox(
            width: 180,
            child: BlocBuilder<BottomNavigationBloc, BottomNavigationState>(
              builder: (context, state) {
                return IconButton(
                  color: state is SettingsScreenState
                      ? Color(0XFFF84490)
                      : Colors.black,
                  onPressed: () {
                    print("onS");
                    BlocProvider.of<BottomNavigationBloc>(context)
                        .add(NavigateToSettingsEvent());
                    // Navigator.of(context).pushReplacementNamed('/settings');
                  },
                  icon: Column(
                    children: [
                      Icon(
                        Icons.settings,
                      ),
                      // Text("Settings"),
                    ],
                  ),
                );
              },
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

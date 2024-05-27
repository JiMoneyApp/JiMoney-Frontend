import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:jimoney_frontend/AfterLogin/widgets/head_sticker.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  static String path = "/settings";

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.maxFinite,
      child: Scaffold(
        body: Column(
          children: [
            Container(
              padding: EdgeInsets.only(top: 70, left: 35, bottom: 20),
              alignment: Alignment.topLeft,
              child: Text(
                "Settings",
                style: TextStyle(fontSize: 20),
              ),
            ),
            Row(
              children: [
                Container(
                  width: 150,
                  padding: EdgeInsets.only(left: 35),
                  alignment: Alignment.center,
                  child: HeadSticker(),
                ),
                Container(
                    width: 230,
                    padding: EdgeInsets.only(left: 50),
                    alignment: Alignment.centerLeft,
                    child: Column(
                      children: [
                        Opacity(opacity: 1, child: Text("NickName", style: TextStyle(fontSize: 20,))),
                        Opacity(opacity: 0.6, child: Text("@ID")),
                      ],
                    )
                ),
              ],
            ),
            // Daily Reminders
            Container(
              padding: EdgeInsets.only(top: 30),
              child: ElevatedButton(
                onPressed: (){},
                child: Text("Daily Reminders", style: TextStyle(fontSize: 20, color: Colors.black)),
                style: ElevatedButton.styleFrom( 
                  minimumSize: Size(320, 50),
                  backgroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                  shadowColor: Colors.black,
                ),  
              ),
            ),
            Container(
              height: 320,
              alignment: Alignment.bottomCenter,
              child: ElevatedButton(
                onPressed: () {},
                child: Text("About Us", style: TextStyle(fontSize: 20, color: Colors.black)),
                style: ElevatedButton.styleFrom( 
                  minimumSize: Size(320, 50),
                  backgroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                  shadowColor: Colors.black,
                ),  
              ),
            ),
            Container(
              height: 90,
              alignment: Alignment.bottomCenter,
              child: ElevatedButton(
                onPressed: () {},
                child: Text("Log Out", style: TextStyle(fontSize: 20, color: Colors.black)),
                style: ElevatedButton.styleFrom( 
                  minimumSize: Size(320, 50),
                  backgroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                  shadowColor: Colors.black,
                ),  
              ),
            )
          ],
        ),
        bottomNavigationBar: BottomAppBar(
            child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              child: IconButton(onPressed: () async{context.go("/home");}, icon: Icon(Icons.home)),
              width: 120,
            ),
            SizedBox(
              child: IconButton(onPressed: () async{context.go("/analytics");}, icon: Icon(Icons.analytics)),
              width: 120,
            ),
            SizedBox(
                child: IconButton(onPressed: () {}, icon: Icon(Icons.settings)),
                width: 120),
          ],
        )),
      ),
    );
  }
}

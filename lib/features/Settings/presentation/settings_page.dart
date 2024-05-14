import 'package:flutter/material.dart';
import 'package:jimoney_frontend/common_widgets/BottomNavigation/bottomNavigationBar.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  static String path = "/settings";

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 50,
              // backgroundImage: AssetImage('assets/avatar.png'),
            ),
            SizedBox(height: 16),
            Text(
              'User Name',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 8),
            ElevatedButton(
              onPressed: () {
                // Add your logic here
              },
              child: Text('Change Avatar'),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigation(),
    );
  }
}

import 'package:flutter/material.dart';

class ChangeBudgetDialog extends StatefulWidget {
  const ChangeBudgetDialog({super.key});

  @override
  State<ChangeBudgetDialog> createState() => _ChangeBudgetDialogState();
}

class _ChangeBudgetDialogState extends State<ChangeBudgetDialog> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        title: Text("Change Budget"),
        content: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                labelText: "New Budget",
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text("Change"),
            ),
          ],
        ));
  }
}

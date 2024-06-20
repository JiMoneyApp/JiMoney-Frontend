import 'package:flutter/material.dart';

class CategoryDialog extends StatelessWidget {
  final Function(String) onCategorySelected;

  CategoryDialog({required this.onCategorySelected});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Select Category'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            leading: Icon(Icons.category),
            title: Text('Category 1'),
            onTap: () {
              onCategorySelected('Category 1');
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(Icons.category),
            title: Text('Category 2'),
            onTap: () {
              onCategorySelected('Category 2');
              Navigator.pop(context);
            },
          ),
          // Add more categories as needed
        ],
      ),
    );
  }
}

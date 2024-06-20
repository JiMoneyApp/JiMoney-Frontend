import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:jimoney_frontend/feature/common/categories.dart';

class CategoryDialog extends StatelessWidget {
  final Function(String) onCategorySelected;

  CategoryDialog({required this.onCategorySelected});
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(''),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            leading: Icon(CategoryItem.food.icon),
            title: Text(CategoryItem.food.name),
            onTap: () {
              onCategorySelected(CategoryItem.food.name);
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(CategoryItem.daily.icon),
            title: Text(CategoryItem.daily.name),
            onTap: () {
              onCategorySelected(CategoryItem.daily.name);
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(CategoryItem.entertainment.icon),
            title: Text(CategoryItem.entertainment.name),
            onTap: () {
              onCategorySelected(CategoryItem.entertainment.name);
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(CategoryItem.traffic.icon),
            title: Text(CategoryItem.traffic.name),
            onTap: () {
              onCategorySelected(CategoryItem.traffic.name);
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(CategoryItem.cloth.icon),
            title: Text(CategoryItem.cloth.name),
            onTap: () {
              onCategorySelected(CategoryItem.cloth.name);
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(CategoryItem.med.icon),
            title: Text(CategoryItem.med.name),
            onTap: () {
              onCategorySelected(CategoryItem.med.name);
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(CategoryItem.education.icon),
            title: Text(CategoryItem.education.name),
            onTap: () {
              onCategorySelected(CategoryItem.education.name);
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(CategoryItem.others.icon),
            title: Text(CategoryItem.others.name),
            onTap: () {
              onCategorySelected(CategoryItem.others.name);
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(CategoryItem.salary.icon),
            title: Text(CategoryItem.salary.name),
            onTap: () {
              onCategorySelected(CategoryItem.salary.name);
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(CategoryItem.invest.icon),
            title: Text(CategoryItem.invest.name),
            onTap: () {
              onCategorySelected(CategoryItem.invest.name);
              Navigator.pop(context);
            },
          ),
          // Add more categories as needed
        ],
      ),
    );
  }
}

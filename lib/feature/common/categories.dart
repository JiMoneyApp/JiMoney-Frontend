import 'package:flutter/material.dart';

enum CategoryType {
  Food,
  Daily,
  Entertainment,
  Traffic,
  Cloth,
  Med,
  Education,
  Others,
  Salary,
  Invest,
}

class CategoryItem {
  final String name;
  final IconData icon;

  CategoryItem({required this.name, required this.icon});

  // 静态成员变量存储不同类型的 CategoryItem 对象
  static final CategoryItem food =
      CategoryItem(name: '飲食', icon: Icons.restaurant_menu);
  static final CategoryItem daily =
      CategoryItem(name: '日用', icon: Icons.shopping_cart);
  static final CategoryItem entertainment =
      CategoryItem(name: '娛樂', icon: Icons.local_movies);
  static final CategoryItem traffic =
      CategoryItem(name: '交通', icon: Icons.directions_car);
  static final CategoryItem cloth =
      CategoryItem(name: '服飾', icon: Icons.shopping_bag);
  static final CategoryItem med =
      CategoryItem(name: '醫療', icon: Icons.local_hospital);
  static final CategoryItem education =
      CategoryItem(name: '教育', icon: Icons.school);
  static final CategoryItem others =
      CategoryItem(name: '其他', icon: Icons.category);
  static final CategoryItem salary =
      CategoryItem(name: '薪水', icon: Icons.attach_money);
  static final CategoryItem invest =
      CategoryItem(name: '投資', icon: Icons.trending_up);

  // 静态方法根据枚举值创建对象
  factory CategoryItem.fromType(CategoryType type) {
    switch (type) {
      case CategoryType.Food:
        return food;
      case CategoryType.Daily:
        return daily;
      case CategoryType.Entertainment:
        return entertainment;
      case CategoryType.Traffic:
        return traffic;
      case CategoryType.Cloth:
        return cloth;
      case CategoryType.Med:
        return med;
      case CategoryType.Education:
        return education;
      case CategoryType.Others:
        return others;
      case CategoryType.Salary:
        return salary;
      case CategoryType.Invest:
        return invest;
      default:
        throw Exception('Unknown CategoryType: $type');
    }
  }
}

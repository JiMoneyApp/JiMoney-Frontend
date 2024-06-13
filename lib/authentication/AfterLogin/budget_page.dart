import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';

class BudgetPage extends StatefulWidget {
  const BudgetPage({super.key});

  static String path = "/budget";

  @override
  State<BudgetPage> createState() => _BudgetPageState();
}

class _BudgetPageState extends State<BudgetPage> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

import 'package:et/expenses_list.dart';
import 'package:flutter/material.dart';
import 'package:et/models/expense.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});
  @override
  State<Expenses> createState() {
    return _ExpensesState();
  }
}

class _ExpensesState extends State<Expenses> {
  final List<Expense> _registeredExpenses = [
    Expense(
        title: 'Flutter Course',
        amount: 19.99,
        date: DateTime.now(),
        category: Category.work),
    Expense(
        title: ' Cinema',
        amount: 100.99,
        date: DateTime.now(),
        category: Category.leisure),
    Expense(
        title: 'Flutter Course',
        amount: 19.99,
        date: DateTime.now(),
        category: Category.work),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: ExpensesList(expenses: _registeredExpenses),
          ),
          const Text('Expenses Data'),
        ],
      ),
    );
  }
}

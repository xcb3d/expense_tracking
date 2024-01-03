import 'package:expense_tracking/expenses_list.dart';
import 'package:expense_tracking/modals/expense.dart';
import 'package:flutter/material.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() {
    return _ExpensesState();
  }
}

class _ExpensesState extends State<Expenses> {
  final List<Expense> registeredExpenses = [
    Expense(
        title: 'Flutter course',
        amount: 19.99,
        date: DateTime.now(),
        category: Categories.work),
    Expense(
        title: 'Cinima',
        amount: 29.99,
        date: DateTime.now(),
        category: Categories.leisure)
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        Text('The Chart'),
        Expanded(child: ExpensesList(expenses: registeredExpenses))
      ]),
    );
  }
}

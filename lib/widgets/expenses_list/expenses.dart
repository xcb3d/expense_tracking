import 'package:expense_tracking/chart/chart.dart';
import 'package:expense_tracking/widgets/expenses_list/expenses_list.dart';
import 'package:expense_tracking/modals/expense.dart';
import 'package:expense_tracking/widgets/expenses_list/new_expense.dart';
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
        title: 'Cinema',
        amount: 29.99,
        date: DateTime.now(),
        category: Categories.leisure),
    Expense(
        title: 'Coffee',
        amount: 3.99,
        date: DateTime.now(),
        category: Categories.leisure),
    Expense(
        title: 'Lunch',
        amount: 10.99,
        date: DateTime.now(),
        category: Categories.food),
    Expense(
        title: 'Ha Noi',
        amount: 40.99,
        date: DateTime.now(),
        category: Categories.travel),
  ];
  void openAddExpenseOverlay() {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (ctx) => NewExpense(
        onAddExpense: addExpense,
      ),
    );
  }

  void addExpense(Expense expense) {
    setState(() {
      registeredExpenses.add(expense);
    });
  }

  void removeExpense(Expense expense) {
    final index = registeredExpenses.indexOf(expense);
    setState(() {
      registeredExpenses.remove(expense);
    });
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: const Duration(seconds: 3),
        content: const Text('Removed'),
        action: SnackBarAction(
          label: 'Undo',
          onPressed: () {
            setState(() {
              registeredExpenses.insert(index, expense);
            });
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget FallbackMessage = const Center(
      child: Text('No expense here. Adding one'),
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('Expenses'),
        actions: [
          IconButton(
              onPressed: openAddExpenseOverlay, icon: const Icon(Icons.add))
        ],
      ),
      body: Column(children: [
        const Text('The Chart'),
        Chart(expenses: registeredExpenses),
        Expanded(
          child: registeredExpenses.isEmpty
              ? FallbackMessage
              : ExpensesList(
                  expenses: registeredExpenses,
                  removeExpense: removeExpense,
                ),
        )
      ]),
    );
  }
}

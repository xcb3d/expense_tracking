import 'package:expense_tracking/main.dart';
import 'package:expense_tracking/modals/expense.dart';
import 'package:expense_tracking/widgets/expenses_list/expenses_item.dart';
import 'package:flutter/material.dart';

class ExpensesList extends StatelessWidget {
  final List<Expense> expenses;
  final void Function(Expense expense) removeExpense;
  const ExpensesList(
      {super.key, required this.expenses, required this.removeExpense});
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: expenses.length,
        itemBuilder: (ctx, index) {
          return Dismissible(
            background: Container(
              color: kColorScheme.error.withOpacity(0.75),
            ),
            key: ValueKey(expenses[index]),
            onDismissed: (direction) {
              removeExpense(expenses[index]);
            },
            child: ExpensesItem(expense: expenses[index]),
          );
        });
  }
}

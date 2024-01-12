import 'package:expense_tracking/modals/expense.dart';
import 'package:flutter/material.dart';

class ExpensesItem extends StatelessWidget {
  final Expense expense;

  const ExpensesItem({super.key, required this.expense});
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 16,
          horizontal: 20,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              expense.title,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(
              height: 4,
            ),
            Row(
              children: [
                Text('${expense.amount.toStringAsFixed(2)}\$'),
                const Spacer(),
                Icon(categoriesIcon[expense.category]),
                const SizedBox(
                  width: 8,
                ),
                Text(expense.formattedDate)
              ],
            )
          ],
        ),
      ),
    );
  }
}

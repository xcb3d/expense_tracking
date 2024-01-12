import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

const uuid = Uuid();

enum Categories { travel, food, leisure, work }

const categoriesIcon = {
  Categories.food: Icons.food_bank_outlined,
  Categories.travel: Icons.place_outlined,
  Categories.leisure: Icons.spa_outlined,
  Categories.work: Icons.work_outline_outlined,
};

class Expense {
  final String id;
  final String title;
  final double amount;
  final DateTime date;
  final Categories category;
  String get formattedDate {
    return "${date.day}/${date.month}/${date.year}";
  }

  Expense(
      {required this.title,
      required this.amount,
      required this.date,
      required this.category})
      : id = uuid.v4();
}

class ExpenseBucket {
  const ExpenseBucket({
    required this.category,
    required this.expenses,
  });

  ExpenseBucket.forCategory(List<Expense> allExpenses, this.category)
      : expenses = allExpenses
            .where((expense) => expense.category == category)
            .toList();

  final Categories category;
  final List<Expense> expenses;

  double get totalExpenses {
    double sum = 0;

    for (final expense in expenses) {
      sum += expense.amount; // sum = sum + expense.amount
    }

    return sum;
  }
}

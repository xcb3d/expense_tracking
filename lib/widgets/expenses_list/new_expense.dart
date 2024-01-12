import 'package:expense_tracking/modals/expense.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewExpense extends StatefulWidget {
  final void Function(Expense expense) onAddExpense;

  const NewExpense({super.key, required this.onAddExpense});

  @override
  State<NewExpense> createState() {
    return _NewExpenseState();
  }
}

class _NewExpenseState extends State<NewExpense> {
  final titleController = TextEditingController();
  final amountController = TextEditingController();
  DateTime? selectedDate;
  Categories selectedCategories = Categories.leisure;

  void presentDatePicker() async {
    final pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2024),
      lastDate: DateTime(2025),
    );
    setState(() {
      selectedDate = pickedDate;
    });
  }

  void summitExpenseData() {
    final amountData = double.tryParse(amountController.text);
    final isAmountDataValid = amountData == null || amountData <= 0;

    if (titleController.text.trim().isEmpty ||
        isAmountDataValid ||
        selectedDate == null) {
      showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: const Text('Error'),
          content: const Text('Enter valid amount, title and date'),
          actions: [
            TextButton(
                onPressed: () {
                  Navigator.of(ctx).pop();
                },
                child: const Text('Okay'))
          ],
        ),
      );
      return;
    }
    widget.onAddExpense(Expense(
        title: titleController.text,
        amount: amountData,
        date: selectedDate!,
        category: selectedCategories));
    Navigator.of(context).pop();
  }

  @override
  void dispose() {
    titleController.dispose();
    amountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          TextField(
            controller: titleController,
            maxLength: 50,
            decoration: const InputDecoration(label: Text('Title')),
          ),
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: amountController,
                  decoration: const InputDecoration(
                      label: Text('Amount'), prefixText: '\$ '),
                  keyboardType: TextInputType.number,
                ),
              ),
              const SizedBox(
                width: 16,
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      selectedDate == null
                          ? 'No Selected Date'
                          : DateFormat.yMd().format(selectedDate!),
                      // style: Theme.of(context).textTheme.displayLarge,
                    ),
                    IconButton(
                      onPressed: presentDatePicker,
                      icon: const Icon(Icons.calendar_month),
                    )
                  ],
                ),
              )
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              DropdownButton(
                  value: selectedCategories,
                  items: Categories.values
                      .map((category) => DropdownMenuItem(
                          value: category,
                          child: Text(category.name.toUpperCase())))
                      .toList(),
                  onChanged: (value) {
                    if (value == null) return;
                    setState(() {
                      selectedCategories = value;
                    });
                  }),
              const Spacer(),
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('Cancel')),
              const SizedBox(
                width: 5,
              ),
              ElevatedButton(
                  onPressed: summitExpenseData,
                  child: const Text('Save Expense'))
            ],
          )
        ],
      ),
    );
  }
}

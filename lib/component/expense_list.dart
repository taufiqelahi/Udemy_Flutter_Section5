import 'package:expense_tracker/component/expense_item.dart';
import 'package:expense_tracker/model/expense.dart';
import 'package:flutter/material.dart';

class ExpenseList extends StatelessWidget {
  final List<Expense> expenses;
  final void Function(Expense expense) onRemove;
  const ExpenseList(
      {super.key, required this.expenses, required this.onRemove});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: expenses.length,
      itemBuilder: (context, index) {
        final expense = expenses[index];
        return Dismissible(

            key: ValueKey(expenses[index]),
            onDismissed: (d) {
              onRemove(expenses[index]);
            },
            child: ExpenseItem(expense: expense));
      },
    );
  }
}

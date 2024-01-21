import 'package:expense_tracker/model/expense.dart';
import 'package:flutter/material.dart';

class ExpenseItem extends StatelessWidget {
  const ExpenseItem({super.key, required this.expense});
  final Expense expense;

  @override
  Widget build(BuildContext context) {
    return Card(
        child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        children: [
          Column(
            children: [
              Text(expense.title),
              SizedBox(
                height: 4,
              ),
              Row(
                children: [
                  Icon(categoryIcons[expense.category]),
                  SizedBox(
                    width: 4,
                  ),
                  Text(expense.category.toString()),
                ],
              )
            ],
          ),
          Spacer(),
          Column(
            children: [
              Text('\$${expense.amount.toStringAsFixed(2)}'),
              SizedBox(
                height: 4,
              ),
              Row(
                children: [
                  Icon(Icons.calendar_today),
                  SizedBox(
                    width: 4,
                  ),
                  Text(expense.formattedDate),
                ],
              )
            ],
          )
        ],
      ),
    ));
  }
}

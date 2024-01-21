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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(expense.title),
              const SizedBox(
                height: 4,
              ),
              Text('\$${expense.amount.toStringAsFixed(2)}'),
            ],
          ),
          const Spacer(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(categoryIcons[expense.category]),
                  const SizedBox(
                    width: 6,
                  ),
                  Text(expense.category.toString()),
                ],
              ),
              const SizedBox(
                height: 4,
              ),
              Row(
                children: [
                  const Icon(Icons.calendar_today),
                  const SizedBox(
                    width: 6,
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

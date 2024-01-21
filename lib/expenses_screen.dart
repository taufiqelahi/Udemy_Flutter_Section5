import 'package:expense_tracker/component/expense_list.dart';
import 'package:expense_tracker/model/expense.dart';
import 'package:flutter/material.dart';

class ExpensesScreen extends StatefulWidget {
  const ExpensesScreen({super.key});

  @override
  State<ExpensesScreen> createState() => _ExpensesScreenState();
}

class _ExpensesScreenState extends State<ExpensesScreen> {
  final List<Expense> _expenses = [
    Expense(title: 'Flutter udemy Course', category: Category.work, amount: 12.99, date: DateTime.now()),
    Expense(title: 'New Desk', category: Category.leisure, amount: 99.99, date: DateTime.now()),


  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body:Center(
        child: Column(
          children: [
            const Text('Expenses'),

            Expanded(child: ExpenseList(expenses: _expenses ))
          ],
        ),
      ),
    );
  }
}

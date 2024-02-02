import 'package:expense_tracker/component/bottom_sheet_items.dart';
import 'package:expense_tracker/component/chart/chart.dart';
import 'package:expense_tracker/component/chart/chart_bar.dart';
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
    Expense(
        title: 'Flutter udemy Course',
        category: Categories.work,
        amount: 12.99,
        date: DateTime.now()),
    Expense(
        title: 'New Desk',
        category: Categories.leisure,
        amount: 99.99,
        date: DateTime.now()),
  ];
  void openAndAddExpense() {
    showModalBottomSheet(
      useSafeArea: true,
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return BottomSheetItems(
          getExpanse: addExpense,
        );
      },
    );
  }

  addExpense(Expense expense) {
    setState(() {
      _expenses.add(expense);
    });
  }

  removeExpense(Expense expense) {
    final index = _expenses.indexOf(expense);
    setState(() {
      _expenses.remove(expense);
    });
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      duration: Duration(seconds: 5),
      content: const Text('Expense deleted'),
      action: SnackBarAction(
          label: 'Undo',
          onPressed: () {
            setState(() {
              _expenses.insert(index, expense);
            });
          }),
    ));
  }

  @override
  Widget build(BuildContext context) {
    final width=MediaQuery.of(context).size.width;
    print(width);
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: const Text('Expense Tracker'),
        actions: [
          IconButton(
            onPressed: openAndAddExpense,
            icon: const Icon(Icons.add),
          )
        ],
      ),
      body:width<600? Column(
        children: [
          Chart(expenses: _expenses),
          Expanded(
              child: _expenses.isNotEmpty
                  ? ExpenseList(
                      expenses: _expenses,
                      onRemove: removeExpense,
                    )
                  : const Center(
                      child: Text('No Expanse Avilable ,Add your Expense')))
        ],
      ): Row(
        children: [
          Expanded(child: Chart(expenses: _expenses)),
          Expanded(
              child: _expenses.isNotEmpty
                  ? ExpenseList(
                expenses: _expenses,
                onRemove: removeExpense,
              )
                  : const Center(
                  child: Text('No Expanse Avilable ,Add your Expense')))
        ],
      ),
    );
  }
}

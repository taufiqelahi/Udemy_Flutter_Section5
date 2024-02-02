import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';

final uuid = Uuid();

const categoryIcons = {
  Categories.food: Icons.dinner_dining,
  Categories.travel: Icons.flight,
  Categories.leisure: Icons.movie,
  Categories.work: Icons.work,
};

enum Categories {
  food,
  travel,
  leisure,
  work,
}

class Expense {
  final String id;
  final String title;
  final double amount;
  final DateTime date;
  final Categories category;
  Expense({
    required this.title,
    required this.category,
    required this.amount,
    required this.date,
  }) : id = uuid.v4();

  String get formattedDate {
    return DateFormat.yMd().format(date);
  }

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
      sum += expense.amount;// sum = sum + expense.amount
    }

    return sum;

  }
}
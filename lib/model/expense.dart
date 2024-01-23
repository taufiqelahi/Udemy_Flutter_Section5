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

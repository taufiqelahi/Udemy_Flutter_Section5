import 'package:expense_tracker/expenses_screen.dart';
import 'package:flutter/material.dart';

var kColorSchema =
    ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 96, 59, 181));

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData().copyWith(
        colorScheme: kColorSchema,
        appBarTheme: AppBarTheme(
          backgroundColor: kColorSchema.primaryContainer,
          foregroundColor: kColorSchema.onPrimaryContainer
        ),
        cardTheme: CardTheme().copyWith(
          color: kColorSchema.secondaryContainer,
          margin: EdgeInsets.symmetric(horizontal: 16,vertical: 6),
        )
      ),
      home: const ExpensesScreen(),
    );
  }
}

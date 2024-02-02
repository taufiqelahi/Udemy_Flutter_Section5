import 'package:expense_tracker/component/chart/chart_bar.dart';
import 'package:expense_tracker/expenses_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

var kColorSchema =
    ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 96, 59, 181));
var darkColorSchema =
    ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 5, 99, 125));

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((value) {
    runApp(const MyApp());
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      darkTheme: ThemeData.dark().copyWith(
          colorScheme: darkColorSchema,
          brightness: Brightness.dark,
          appBarTheme: AppBarTheme(
              backgroundColor: darkColorSchema.primaryContainer,
              foregroundColor: darkColorSchema.onPrimaryContainer),
          cardTheme: CardTheme().copyWith(
            color: darkColorSchema.secondaryContainer,
            margin: EdgeInsets.symmetric(horizontal: 16, vertical: 6),
          ),
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              backgroundColor: darkColorSchema.primaryContainer,
            ),
          ),
          textTheme: TextTheme().copyWith(
            titleLarge: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.normal,
                color: darkColorSchema.onSecondaryContainer),
            bodyMedium: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.normal,
              color: darkColorSchema.onSecondaryContainer,
            ),
            titleMedium: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.normal,
                color: darkColorSchema.onSecondaryContainer),
            bodyLarge: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.normal,
                color: darkColorSchema.onSecondaryContainer),
            bodySmall: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.normal,
                color: darkColorSchema.onSecondaryContainer),
          )),
      theme: ThemeData().copyWith(
          colorScheme: kColorSchema,
          appBarTheme: AppBarTheme(
              backgroundColor: kColorSchema.primaryContainer,
              foregroundColor: kColorSchema.onPrimaryContainer),
          cardTheme: CardTheme().copyWith(
            color: kColorSchema.secondaryContainer,
            margin: EdgeInsets.symmetric(horizontal: 16, vertical: 6),
          ),
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              backgroundColor: kColorSchema.primaryContainer,
            ),
          ),
          textTheme: TextTheme().copyWith(
            titleLarge: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.normal,
                color: kColorSchema.onSecondaryContainer),
            bodyMedium: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.normal,
              color: kColorSchema.onSecondaryContainer,
            ),
            titleMedium: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.normal,
                color: kColorSchema.onSecondaryContainer),
            bodyLarge: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.normal,
                color: kColorSchema.onSecondaryContainer),
            bodySmall: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.normal,
                color: kColorSchema.onSecondaryContainer),
          )),
      themeMode: ThemeMode.system,
      home: ExpensesScreen(),
    );
  }
}

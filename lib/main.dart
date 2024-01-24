// ignore_for_file: must_be_immutable

import 'package:expenses/widgets/p_expenses.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  ColorScheme colorScheme =
      ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 59, 96, 179));

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData().copyWith(
        colorScheme: colorScheme,
        appBarTheme: AppBarTheme(
          backgroundColor: colorScheme.primaryContainer,
          foregroundColor: colorScheme.onPrimaryContainer,
        ),
        cardTheme: const CardTheme().copyWith(
          color: colorScheme.primaryContainer,
          margin: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 8,
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          // set a background color is colorScheme.primaryContainer
          style: ElevatedButton.styleFrom(
            backgroundColor: colorScheme.primaryContainer,
          ),
        ),
        textTheme: ThemeData().textTheme.copyWith(
          titleLarge: TextStyle(
            color: colorScheme.onSecondaryContainer,
            fontSize: 17,
          )
        )
      ),
      home: const PageExpenses(),
    );
  }
}

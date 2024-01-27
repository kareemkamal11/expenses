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

  ColorScheme darkColorScheme =
      ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 59, 96, 179));

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      theme: ThemeData().copyWith(
          colorScheme: colorScheme,
          appBarTheme: AppBarTheme(
            backgroundColor: colorScheme.primary,
            foregroundColor: colorScheme.onPrimary,
          ),
          cardTheme: const CardTheme().copyWith(
            color: colorScheme.secondaryContainer,
            margin: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 8,
            ),
          ),
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              backgroundColor: colorScheme.primaryContainer,
            ),
          ),
          textTheme: ThemeData().textTheme.copyWith(
                  titleLarge: TextStyle(
                color: colorScheme.onSecondaryContainer,
                fontSize: 17,
              ))),
      darkTheme: ThemeData().copyWith(
        scaffoldBackgroundColor: darkColorScheme.onSecondaryContainer,
        colorScheme: darkColorScheme,
        appBarTheme: AppBarTheme(
          backgroundColor: darkColorScheme.onPrimaryContainer,
          foregroundColor: darkColorScheme.primaryContainer,
        ),
        cardTheme: const CardTheme().copyWith(
          color: darkColorScheme.secondaryContainer,
          margin: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 8,
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: darkColorScheme.onPrimaryContainer,
            foregroundColor: darkColorScheme.primaryContainer,
          ),
        ),
        textTheme: ThemeData().textTheme.copyWith(
                titleLarge: TextStyle(
              color: darkColorScheme.onSecondaryContainer,
              fontSize: 17,
            )),
        bottomSheetTheme: const BottomSheetThemeData().copyWith(
          backgroundColor: darkColorScheme.onPrimaryContainer,
        ),
      ),
      home: const PageExpenses(),
    );
  }
}

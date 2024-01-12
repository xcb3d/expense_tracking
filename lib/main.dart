import 'package:expense_tracking/widgets/expenses_list/expenses.dart';
import 'package:flutter/material.dart';

var kColorScheme =
    ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 96, 59, 181));
var kDarkColorScheme = ColorScheme.fromSeed(
    brightness: Brightness.dark,
    seedColor: const Color.fromARGB(255, 5, 99, 125));
void main() {
  ThemeData myTheme = ThemeData(
    cardTheme: CardTheme(
        color: kColorScheme.secondaryContainer,
        margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16)),
    colorScheme: kColorScheme,
    appBarTheme: AppBarTheme(
      backgroundColor: kColorScheme.onPrimaryContainer,
      foregroundColor: kColorScheme.primaryContainer,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: kColorScheme.primaryContainer,
      ),
    ),
    textTheme: TextTheme(
      titleLarge: TextStyle(
        color: kColorScheme.onPrimaryContainer,
        fontWeight: FontWeight.bold,
        fontSize: 16,
      ),
    ),
  );
  ThemeData darkTheme = ThemeData(
    cardTheme: CardTheme(
        color: kDarkColorScheme.secondaryContainer,
        margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16)),
    colorScheme: kDarkColorScheme,
    appBarTheme: AppBarTheme(
      backgroundColor: kDarkColorScheme.onPrimaryContainer,
      foregroundColor: kDarkColorScheme.primaryContainer,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: kDarkColorScheme.primaryContainer,
      ),
    ),
    textTheme: TextTheme(
      titleLarge: TextStyle(
        color: kDarkColorScheme.onPrimaryContainer,
        fontWeight: FontWeight.bold,
        fontSize: 16,
      ),
    ),
  );

  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    darkTheme: darkTheme,
    theme: myTheme,
    home: const Expenses(),
    // themeMode: ThemeMode.system,
  ));
}

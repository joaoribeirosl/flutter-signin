import 'package:flutter/material.dart';

class DarkTheme {
  static const primaryColorDark = Color.fromRGBO(154, 111, 233, 1);
  static const backgroundColorDark = Color.fromRGBO(25, 39, 52, 1);
  static const cardColorDark = Color.fromRGBO(34, 24, 84, 1);
  static const accentColor = Color.fromRGBO(255, 193, 7, 1);

  static ThemeData get theme {
    return ThemeData(
      brightness: Brightness.dark,
      primaryColor: primaryColorDark,
      scaffoldBackgroundColor: backgroundColorDark,
      cardColor: cardColorDark,
      appBarTheme: const AppBarTheme(
        backgroundColor: backgroundColorDark,
        iconTheme: IconThemeData(color: Colors.white),
        titleTextStyle: TextStyle(color: Colors.white, fontSize: 20),
      ),
      expansionTileTheme: const ExpansionTileThemeData(
          textColor: primaryColorDark, collapsedTextColor: primaryColorDark),
      listTileTheme: const ListTileThemeData(
        textColor: primaryColorDark,
        iconColor: Colors.white,
      ),
      textTheme: const TextTheme(
        displaySmall: TextStyle(color: Colors.white),
        titleSmall: TextStyle(color: primaryColorDark),
        titleLarge: TextStyle(color: primaryColorDark),
        titleMedium: TextStyle(
          color: primaryColorDark,
          fontWeight: FontWeight.normal,
          fontSize: 16,
        ),
        bodySmall: TextStyle(
          color: primaryColorDark,
        ),
        bodyMedium: TextStyle(
          color: primaryColorDark,
          fontSize: 16,
        ),
        labelMedium: TextStyle(
          color: primaryColorDark,
        ),
        labelLarge: TextStyle(
          color: primaryColorDark,
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: primaryColorDark,
          foregroundColor: Colors.white,
          textStyle: const TextStyle(fontWeight: FontWeight.normal),
        ),
      ),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: accentColor,
        foregroundColor: Colors.black,
      ),
      iconTheme: const IconThemeData(color: Colors.white),
      useMaterial3: true,
    );
  }
}

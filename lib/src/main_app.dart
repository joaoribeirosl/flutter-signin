import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  @override
  Widget build(BuildContext context) {
    const primaryColorLigth = Color.fromRGBO(173, 82, 120, 1);

    return MaterialApp.router(
      title: 'flutter app',
      theme: ThemeData(
        expansionTileTheme: const ExpansionTileThemeData(
            textColor: primaryColorLigth,
            collapsedTextColor: primaryColorLigth),
        listTileTheme: const ListTileThemeData(textColor: primaryColorLigth),
        textTheme: const TextTheme(
          displaySmall: TextStyle(color: Colors.white),
          titleSmall: TextStyle(
            color: primaryColorLigth,
          ),
          titleLarge: TextStyle(
            color: primaryColorLigth,
          ),
          titleMedium: TextStyle(
              color: primaryColorLigth,
              fontWeight: FontWeight.normal,
              fontSize: 16),
          bodySmall: TextStyle(
            color: primaryColorLigth,
          ),
          bodyMedium: TextStyle(
            color: primaryColorLigth,
            fontSize: 16,
          ),
          labelMedium: TextStyle(
            color: primaryColorLigth,
          ),
          labelLarge: TextStyle(
            color: primaryColorLigth,
          ),
        ),
        checkboxTheme: const CheckboxThemeData(
          side: BorderSide(color: primaryColorLigth),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: primaryColorLigth,
            foregroundColor: Colors.white,
            textStyle: const TextStyle(fontWeight: FontWeight.normal),
          ),
        ),
        useMaterial3: true,
      ),
      routerConfig: Modular.routerConfig,
    );
  }
}

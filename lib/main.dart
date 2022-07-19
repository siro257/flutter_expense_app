import 'package:flutter/material.dart';
import 'package:flutter_expense_app/constants.dart';
import 'package:material_color_generator/material_color_generator.dart';

import 'home_page.dart';

void main() {
  runApp(ExpenseApp());
}

class ExpenseApp extends StatelessWidget {
  ExpenseApp({Key? key}) : super(key: key);

  final ValueNotifier<ThemeMode> themeNotifier = ValueNotifier(ThemeMode.light);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<ThemeMode>(
        valueListenable: themeNotifier,
        builder: (_, ThemeMode currentMode, __) {
          return MaterialApp(
            title: 'Expense App',
            theme: ThemeData(
              brightness: Brightness.light,
              primarySwatch: generateMaterialColor(color: kTextColor),
            ),
            darkTheme: ThemeData(
              brightness: Brightness.dark,
            ),
            themeMode: currentMode,
            home: HomePage(
              title: 'Expense App',
              themeNotifier: themeNotifier,
              currentMode: currentMode,
            ),
          );
        });
  }
}

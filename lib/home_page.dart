import 'package:flutter/material.dart';

import 'constants.dart';

class HomePage extends StatefulWidget {
  const HomePage(
      {Key? key,
      required this.title,
      required this.themeNotifier,
      required this.currentMode})
      : super(key: key);

  final String title;
  final ValueNotifier<ThemeMode> themeNotifier;
  final ThemeMode currentMode;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void _toggleThemeMode() {
    widget.themeNotifier.value = widget.currentMode == ThemeMode.light
        ? ThemeMode.dark
        : ThemeMode.light;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 32.0),
            child: FloatingActionButton(
              onPressed: _toggleThemeMode,
              tooltip: 'Light/Dark mode',
              child: Icon(widget.themeNotifier.value == ThemeMode.light
                  ? Icons.dark_mode
                  : Icons.light_mode),
            ),
          ),
          FloatingActionButton(
            onPressed: () async {
              await _showExpenseDialog(context);
            },
            tooltip: 'Add Task',
            child: Icon(Icons.add),
          ),
        ],
      ),
    );
  }

  Future<dynamic> _showExpenseDialog(BuildContext context) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Enter Your Expense"),
          // TODO: for content:
          // Add 2 Textfields (Expense Item & Expense amount)
          // implement Expense add function
          content: Text("expense content goes here"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text(
                "add",
                style: TextStyle(
                  color: kAccentColor,
                ),
              ),
            )
          ],
        );
      },
    );
  }
}

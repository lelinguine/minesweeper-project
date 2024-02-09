import 'package:flutter/material.dart';

import 'package:minesweeper/context.dart';
import 'package:minesweeper/view/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: context.customTitle,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: context.isDark()
            ? const Color.fromARGB(255, 0, 0, 0)
            : const Color.fromARGB(255, 255, 255, 255),
        primaryColor: context.isDark() ? Colors.black : Colors.white,
        secondaryHeaderColor: context.isDark() ? Colors.white : Colors.black,
        brightness: context.isDark() ? Brightness.dark : Brightness.light,
        textTheme: const TextTheme(
          titleLarge: TextStyle(
            fontSize: 36.0,
            height: 1.2,
          ),
          titleMedium: TextStyle(
            fontSize: 20.0,
          ),
          bodyMedium: TextStyle(fontSize: 16.0, height: 1.3),
        ),
      ),
      home: const MyHome(),
    );
  }
}

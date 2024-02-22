import 'package:flutter/material.dart';

import 'package:minesweeper/context.dart';
import 'package:minesweeper/view/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

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
        textTheme: TextTheme(
          titleLarge: TextStyle(
              fontSize: 48.0,
              fontWeight: FontWeight.w900,
              color: context.isDark() ? Colors.white : Colors.black),
          titleMedium: TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.w600,
              color: context.isDark() ? Colors.white : Colors.black),
          bodyMedium: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.w600,
              color: context.isDark() ? Colors.white : Colors.black),
        ),
      ),
      home: const MyHome(),
    );
  }
}

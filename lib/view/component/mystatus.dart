import 'dart:math'; // Importez la classe Random

import 'package:flutter/material.dart';

class MyStatus extends StatefulWidget {
  const MyStatus({super.key});

  @override
  MyStatusState createState() => MyStatusState();
}

class MyStatusState extends State<MyStatus> {
  late String status = 'Let\'s start digging!';

  final List<String> encouragementMessages = [
    'Keep digging!',
    'Avoiding disaster!',
  ];

  @override
  Widget build(BuildContext context) {
    return Text(
      status,
      style: Theme.of(context).textTheme.titleSmall,
    );
  }

  void updateStatus() {
    setState(() {
      final Random random = Random();
      final int randomIndex = random.nextInt(encouragementMessages.length);
      status = encouragementMessages[randomIndex];
    });
  }

  void onGameVictory() {
    setState(() {
      status = 'Minefield conquered!';
    });
  }

  void onGameLose() {
    setState(() {
      status = 'Ka-boom!';
    });
  }
}

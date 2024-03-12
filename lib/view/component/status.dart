import 'package:flutter/material.dart';

class MyStatus extends StatefulWidget {
  const MyStatus({super.key});

  @override
  MyStatusState createState() => MyStatusState();
}

class MyStatusState extends State<MyStatus> {
  late String status = '';

  @override
  Widget build(BuildContext context) {
    return Text(
      status,
      style: Theme.of(context).textTheme.titleMedium,
    );
  }

  void onGameVictory() {
    setState(() {
      status = 'You won!';
    });
  }

  void onGameLose() {
    setState(() {
      status = 'You lose!';
    });
  }
}

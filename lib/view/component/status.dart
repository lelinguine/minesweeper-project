import 'package:flutter/material.dart';

class MyStatus extends StatefulWidget {
  const MyStatus({super.key});

  @override
  MyStatusState createState() => MyStatusState();
}

class MyStatusState extends State<MyStatus> {
  late String status = 'You win!';

  @override
  Widget build(BuildContext context) {
    return Text(
      status,
      style: Theme.of(context).textTheme.titleMedium,
    );
  }

  void _OnGameVictory() {
    setState(() {
      status = 'You won!';
    });
  }

  void _OnGameLose() {
    setState(() {
      status = 'You lose!';
    });
  }
}

import 'package:flutter/material.dart';

class MyScore extends StatefulWidget {
  const MyScore({super.key});

  @override
  MyScoreState createState() => MyScoreState();
}

class MyScoreState extends State<MyScore> {
  int score = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      score != 0 ? "${score}pts" : "",
      style: Theme.of(context).textTheme.bodyMedium,
    );
  }
}

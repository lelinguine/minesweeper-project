import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyScore extends StatefulWidget {
  const MyScore({Key? key}) : super(key: key);

  @override
  MyScoreState createState() => MyScoreState();
}

class MyScoreState extends State<MyScore> {
  int score = 0;

  @override
  void initState() {
    super.initState();
    _saveScore(28);
    _loadScore();
  }

  Future<void> _saveScore(int newScore) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt('score', newScore);
    setState(() {
      score = newScore;
    });
  }

  Future<void> _loadScore() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      score = prefs.getInt('score') ?? 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      "${score}pts",
      style: Theme.of(context).textTheme.titleMedium,
    );
  }
}

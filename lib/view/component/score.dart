import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyScore extends StatefulWidget {
  const MyScore({Key? key}) : super(key: key);

  @override
  MyScoreState createState() => MyScoreState();
}

class MyScoreState extends State<MyScore> {
  String score = '';

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
      score = newScore.toString();
    });
  }

  Future<void> _loadScore() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      score = prefs.getString('score') ?? '';
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

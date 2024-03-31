import 'package:flutter/material.dart';
import 'package:minesweeper/provider/mygamemanager.dart';

import 'package:provider/provider.dart';
import 'package:minesweeper/provider/myusermanager.dart';

class MyScore extends StatefulWidget {
  const MyScore({super.key});

  @override
  MyScoreState createState() => MyScoreState();
}

class MyScoreState extends State<MyScore> {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<MyUserManager>(context);
    final manager = Provider.of<MyGameManager>(context);

    int score = user.current != null ? user.score : manager.score;

    return Text(
      score != 0 ? "${score}pts" : "0pts",
      style: Theme.of(context).textTheme.bodyMedium,
    );
  }
}

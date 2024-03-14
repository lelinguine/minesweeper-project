import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:minesweeper/provider/game.dart';

class MyResult extends StatefulWidget {
  const MyResult({super.key});

  @override
  MyResultState createState() => MyResultState();
}

class MyResultState extends State<MyResult> {
  @override
  Widget build(BuildContext context) {
    int score = Provider.of<Game>(context).getScore();

    return Text(
      score != 0 ? "${score}pts" : "",
      style: Theme.of(context).textTheme.bodyMedium,
    );
  }
}

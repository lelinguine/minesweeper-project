import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:minesweeper/provider/mygamemanager.dart';

class MyResult extends StatefulWidget {
  const MyResult({super.key});

  @override
  MyResultState createState() => MyResultState();
}

class MyResultState extends State<MyResult> {
  @override
  Widget build(BuildContext context) {
    int score = Provider.of<MyGameManager>(context).score;

    return Text(
      score != 0 ? "${score}pts" : "0pts",
      style: Theme.of(context).textTheme.bodyMedium,
    );
  }
}

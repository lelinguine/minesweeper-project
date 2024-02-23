import 'package:flutter/material.dart';

import 'package:minesweeper/data/storage.dart';

class MyScore extends StatefulWidget {
  const MyScore({Key? key}) : super(key: key);

  @override
  MyScoreState createState() => MyScoreState();
}

class MyScoreState extends State<MyScore> {

  MyStorage storage = MyStorage();

  int score = 0;

  @override
  void initState() {
    super.initState();

    storage.saveStorageInt('score', 28);

    storage.loadStorageInt('score').then((value) {
      setState(() {
        score = value;
      });
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

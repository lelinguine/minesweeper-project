import 'package:flutter/material.dart';

import 'package:minesweeper/data/storage.dart';

import 'package:provider/provider.dart';
import 'package:minesweeper/provider/manager.dart';

class MyScore extends StatefulWidget {
  const MyScore({super.key});

  @override
  MyScoreState createState() => MyScoreState();
}

class MyScoreState extends State<MyScore> {
  MyStorage storage = MyStorage();

  // int score = 0;

  // @override
  // void initState() {
  //   super.initState();

  //   storage.saveStorageInt('score', 0);

  //   storage.loadStorageInt('score').then((value) {
  //     setState(() {
  //       score = value;
  //     });
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    final manager = Provider.of<Manager>(context);

    int score = manager.best;

    return Text(
      score != 0 ? "${score}pts" : "",
      style: Theme.of(context).textTheme.titleSmall,
    );
  }
}

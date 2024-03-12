import 'package:flutter/material.dart';

import 'package:minesweeper/data/storage.dart';

class MyInfo extends StatefulWidget {
  const MyInfo({super.key});

  @override
  MyInfoState createState() => MyInfoState();
}

class MyInfoState extends State<MyInfo> {
  MyStorage storage = MyStorage();

  int score = 0;

  @override
  void initState() {
    super.initState();

    storage.clearLocalStorage();

    storage.loadStorageInt('score').then((value) {
      setState(() {
        score = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      score != 0 ? "${score}pts" : "",
      style: Theme.of(context).textTheme.titleMedium,
    );
  }
}

import 'package:flutter/material.dart';

import 'package:minesweeper/context.dart';
import 'package:minesweeper/data/storage.dart';

class MySelect extends StatefulWidget {
  const MySelect({
    super.key,
    required this.icon,
    required this.height,
    required this.width,
  });

  final String icon;
  final double height, width;

  @override
  MySelectState createState() => MySelectState();
}

class MySelectState extends State<MySelect> {
  MySelectState();

  MyStorage storage = MyStorage();

  String difficulty = "Easy";
  Color color = const Color(0xFF06d6a0);

  @override
  void initState() {
    super.initState();

    storage.loadStorageString('difficulty').then((value) {
      setState(() {
        difficulty = value;
      });
    });

    storage.loadStorageInt('color').then((value) {
      setState(() {
        color = Color(value);
      });
    });
  }

  String getDifficulty() {
    return difficulty;
  }

  void updateDifficulty() {
    setState(() {
      if (difficulty == "Easy") {
        difficulty = "Medium";
        color = const Color(0xFF118ab2);
      } else if (difficulty == "Medium") {
        difficulty = "Hard";
        color = const Color(0xFFef476f);
      } else if (difficulty == "Hard") {
        difficulty = "Easy";
        color = const Color(0xFF06d6a0);
      }
      storage.saveStorageString('difficulty', difficulty);
      storage.saveStorageInt('color', color.value);
    });
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: Container(
        height: widget.height,
        width: widget.width,
        color: color,
        child: Stack(
          children: [
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(difficulty,
                      style: Theme.of(context).textTheme.titleMedium),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(right: 10.0),
              child: Align(
                alignment: Alignment.centerRight,
                child: Image.asset(
                  context.getAssets() + widget.icon,
                  height: 18,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
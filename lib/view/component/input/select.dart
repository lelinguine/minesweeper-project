import 'package:flutter/material.dart';

import 'package:minesweeper/context.dart';

class MySelect extends StatefulWidget {
  const MySelect({
    Key? key,
    required this.difficulty,
    required this.icon,
    required this.height,
    required this.width,
  }) : super(key: key);

  final String difficulty, icon;
  final double height, width;

  @override
  MySelectState createState() => MySelectState(difficulty: difficulty);
}

class MySelectState extends State<MySelect> {
  MySelectState({required this.difficulty});

  String difficulty;

  void updateDifficulty(String tmp) {
    setState(() {
      difficulty = tmp;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.height,
      width: widget.width,
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
    );
  }
}

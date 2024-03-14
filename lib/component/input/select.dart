import 'package:flutter/material.dart';
import 'package:minesweeper/context.dart';

import 'package:provider/provider.dart';
import 'package:minesweeper/provider/game.dart';

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

  @override
  Widget build(BuildContext context) {
    final game = Provider.of<Game>(context);
    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: Container(
        height: widget.height,
        width: widget.width,
        color: game.color,
        child: Stack(
          children: [
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(game.difficulty,
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

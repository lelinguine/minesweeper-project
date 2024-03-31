import 'package:flutter/material.dart';
import 'package:minesweeper/context.dart';

import 'package:provider/provider.dart';
import 'package:minesweeper/provider/manager.dart';

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
    final manager = Provider.of<Manager>(context);

    return ClipRRect(
      borderRadius: BorderRadius.circular(19),
      child: Container(
        height: widget.height,
        width: widget.width,
        color: manager.color,
        child: Stack(
          children: [
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(manager.difficulty,
                      style: Theme.of(context).textTheme.titleSmall),
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

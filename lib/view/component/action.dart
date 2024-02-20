import 'package:flutter/material.dart';

import 'package:minesweeper/context.dart';

class MyAction extends StatelessWidget {
  const MyAction({super.key, required this.title, required this.icon,
  required this.height, required this.width});

  final String title, icon;
  final double height, width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: height,
        width: width,
        child: Stack(
          children: [
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(title, style: Theme.of(context).textTheme.titleMedium),
                ],
              ),
            ),
            Container(
                margin: const EdgeInsets.only(right: 10.0),
                child: Align(
                    alignment: Alignment.centerRight,
                    child: Image.asset(
                      context.getAssets() + icon,
                      height: 18,
                    )))
          ],
        ));
  }
}

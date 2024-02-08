import 'package:flutter/material.dart';

import 'package:minesweeper/context.dart';

class MyStart extends StatelessWidget {
  const MyStart(
      {super.key,
      required this.title,
      required this.score,
      required this.slot});

  final String title, score, slot;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 70,
        width: 290,
        child: Stack(
          children: [
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(title, style: Theme.of(context).textTheme.titleMedium),
                  Text("${score}pts",
                      style: Theme.of(context).textTheme.bodyMedium),
                ],
              ),
            ),
            Positioned(
              bottom: 5,
              right: 5,
              child: Row(
                children: [
                  Image.asset(
                    context.getAssets() + slot,
                    height: 18,
                  )
                ],
              ),
            ),
          ],
        ));
  }
}

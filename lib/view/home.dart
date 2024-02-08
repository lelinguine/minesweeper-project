import 'package:flutter/material.dart';

import 'package:minesweeper/context.dart';

import 'package:minesweeper/view/component/button.dart';
import 'package:minesweeper/view/component/start.dart';

import 'package:minesweeper/view/navigation.dart';
import 'package:minesweeper/view/test.dart';

class MyHome extends StatelessWidget {
  const MyHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              context.customTitle,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                MyButton(
                  action: () => pushOptions(context, const MyTest()),
                  child: const MyStart(
                    title: 'Minesweeper',
                    score: '0',
                    slot: 'start.png',
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

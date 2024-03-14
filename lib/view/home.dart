import 'package:flutter/material.dart';
import 'package:minesweeper/context.dart';

import 'package:minesweeper/component/input/button.dart';
import 'package:minesweeper/component/input/default.dart';
import 'package:minesweeper/component/score.dart';

import 'package:minesweeper/view/navigation.dart';
import 'package:minesweeper/view/rule.dart';

class MyHome extends StatelessWidget {
  const MyHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  context.customTitle,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const MyScore(),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(bottom: 20.0),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: MyButton(
                action: () => pushOptions(context, const MyRule()),
                child: const MyAction(
                  title: 'New game',
                  icon: 'start.png',
                  height: 40,
                  width: 400,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

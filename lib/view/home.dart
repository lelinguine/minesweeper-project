import 'package:flutter/material.dart';

import 'package:minesweeper/context.dart';

import 'package:minesweeper/view/component/input/button.dart';
import 'package:minesweeper/view/component/input/default.dart';

import 'package:minesweeper/view/navigation.dart';
import 'package:minesweeper/view/rule.dart';

class MyHome extends StatelessWidget {
  const MyHome({Key? key, required this.score}) : super(key: key);

  final String score;

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
                Text("${score}pts",
                    style: Theme.of(context).textTheme.titleMedium),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(bottom: 20.0),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: MyButton(
                action: () => pushOptions(context, MyRule()),
                child: const MyAction(
                  title: 'New game',
                  icon: 'start.png',
                  height: 40,
                  width: 300,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

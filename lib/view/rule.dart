import 'package:flutter/material.dart';

import 'package:minesweeper/context.dart';

import 'package:minesweeper/view/component/button.dart';
import 'package:minesweeper/view/component/action.dart';

import 'package:minesweeper/view/navigation.dart';
import 'package:minesweeper/view/game.dart';

class MyRule extends StatelessWidget {
  const MyRule({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: Stack(
        children: [
          Align(
              alignment: Alignment.center,
              child: SizedBox(
                width: 400,
                child: Text(
                  context.customRule,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              )),
          Container(
            margin: const EdgeInsets.only(bottom: 20.0),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: MyButton(
                action: () => pushOptions(context, const MyGame()),
                child: const MyAction(
                  title: 'Understand',
                  icon: 'check.png',
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

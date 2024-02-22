import 'package:flutter/material.dart';

import 'package:minesweeper/context.dart';

import 'package:minesweeper/view/component/input/button.dart';
import 'package:minesweeper/view/component/input/default.dart';
import 'package:minesweeper/view/component/input/select.dart';

import 'package:minesweeper/view/navigation.dart';
import 'package:minesweeper/view/game.dart';

class MyRule extends StatelessWidget {
  final GlobalKey<MySelectState> selectKey = GlobalKey();
  final GlobalKey<MyButtonState> buttonKey = GlobalKey();
  MyRule({Key? key}) : super(key: key);

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
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    MyButton(
                      key: buttonKey,
                      action: () => selectKey.currentState!.updateDifficulty(),
                      child: MySelect(
                        buttonKey: buttonKey,
                        key: selectKey,
                        icon: 'change.png',
                        height: 40,
                        width: 400,
                      ),
                    ),
                    const SizedBox(height: 10),
                    MyButton(
                      action: () =>
                          pushOptions(context, MyGame(difficulty: selectKey.currentState!.getDifficulty())),
                      child: const MyAction(
                        title: 'Understand',
                        icon: 'check.png',
                        height: 40,
                        width: 400,
                      ),
                    ),
                  ],
                )),
          ),
        ],
      ),
    );
  }
}

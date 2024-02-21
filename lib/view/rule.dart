import 'package:flutter/material.dart';

import 'package:minesweeper/context.dart';

import 'package:minesweeper/view/component/input/button.dart';
import 'package:minesweeper/view/component/input/default.dart';
import 'package:minesweeper/view/component/input/select.dart';

import 'package:minesweeper/view/navigation.dart';
import 'package:minesweeper/view/game.dart';

class MyRule extends StatefulWidget {
  MyRule({Key? key}) : super(key: key);

  @override
  MyRuleState createState() => MyRuleState();
}

class MyRuleState extends State<MyRule> {
  MyRuleState();

  String difficulty = "Easy";
  Color color = Color(int.parse('0xFF118ab2'));
  GlobalKey<MySelectState> selectKey = GlobalKey();
  GlobalKey<MyButtonState> buttonKey = GlobalKey();

  void updateDifficulty() {
    setState(() {
      if (difficulty == "Easy") {
        color = Color(int.parse('0xFFf78c6b'));
        difficulty = "Medium";
      } else if (difficulty == "Medium") {
        color = Color(int.parse('0xFFef476f'));
        difficulty = "Hard";
      } else if (difficulty == "Hard") {
        color = Color(int.parse('0xFF118ab2'));
        difficulty = "Easy";
      }
      buttonKey.currentState?.updateColor(color);
      selectKey.currentState?.updateDifficulty(difficulty);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                      color: color,
                      action: () => updateDifficulty(),
                      child: MySelect(
                        key: selectKey,
                        difficulty: difficulty,
                        icon: 'change.png',
                        height: 40,
                        width: 400,
                      ),
                    ),
                    const SizedBox(height: 10),
                    MyButton(
                      action: () =>
                          pushOptions(context, MyGame(difficulty: difficulty)),
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

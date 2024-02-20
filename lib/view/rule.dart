import 'package:flutter/material.dart';

import 'package:minesweeper/context.dart';

import 'package:minesweeper/view/component/button.dart';
import 'package:minesweeper/view/component/action.dart';

import 'package:minesweeper/view/navigation.dart';
import 'package:minesweeper/view/game.dart';

class MyRule extends StatefulWidget {
  MyRule({Key? key}) : super(key: key);

    @override
  _MyRuleState createState() => _MyRuleState();
}

class _MyRuleState extends State<MyRule> {
  _MyRuleState();

  String difficulty = "Easy";

  void _updateDifficulty() {
    setState(() {
      if(difficulty == "Easy")  {
        difficulty = "Medium";
      }
      else if(difficulty == "Medium")  {
        difficulty = "Hard";
      }
      else if(difficulty == "Hard")  {
        difficulty = "Easy";
      }
      print(difficulty);
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
                action: () => _updateDifficulty(),
                child: MyAction(
                  title: difficulty,
                  icon: 'refresh.png',
                  height: 40,
                  width: 300,
                ),
              ),
              const SizedBox(height: 10),
                  MyButton(
                    action: () => pushOptions(context, const MyGame()),
                    child: MyAction(
                      title: 'Understand',
                      icon: 'check.png',
                      height: 40,
                      width: 300,
                    ),
                  ),
                ],
              )
            ),
          ),
        ],
      ),
    );
  }
}

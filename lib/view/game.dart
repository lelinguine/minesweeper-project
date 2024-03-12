import 'package:flutter/material.dart';
import 'package:minesweeper/view/component/input/button.dart';
import 'package:minesweeper/view/component/input/default.dart';
import 'package:minesweeper/view/component/grille.dart';
import 'package:minesweeper/view/component/timer.dart';
import 'package:minesweeper/view/component/status.dart';
import 'package:minesweeper/view/component/score.dart';

class MyGame extends StatelessWidget {
  final GlobalKey<MyStatusState> statusKey = GlobalKey();
  final GlobalKey<MyTimerState> timerKey = GlobalKey();

  MyGame({super.key, required this.difficulty});

  final String difficulty;
  final int score = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                MyStatus(key: statusKey),
                SizedBox(
                    width: 400,
                    height: 400,
                    child: MyGrille(
                      difficulty: difficulty,
                      winState: () => statusKey.currentState!.onGameVictory(),
                      loseState: () => statusKey.currentState!.onGameLose(),
                      stopWatch: () => timerKey.currentState!.stopTimer(),
                    )),
                const MyScore(),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(bottom: 20.0),
            child: Align(
                alignment: Alignment.bottomCenter,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    MyTimer(key: timerKey),
                    const SizedBox(height: 10),
                    MyButton(
                      action: () =>
                          Navigator.popUntil(context, (route) => route.isFirst),
                      child: const MyAction(
                        title: 'Leave',
                        icon: 'finish.png',
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

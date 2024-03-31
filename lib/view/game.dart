import 'package:flutter/material.dart';

import 'package:minesweeper/component/input/button.dart';
import 'package:minesweeper/component/input/default.dart';
import 'package:minesweeper/component/game/grille.dart';
import 'package:minesweeper/component/timer.dart';
import 'package:minesweeper/component/status.dart';
import 'package:minesweeper/component/result.dart';

import 'package:minesweeper/view/navigation.dart';
import 'package:minesweeper/view/resume.dart';

class MyGame extends StatelessWidget {
  final GlobalKey<MyStatusState> statusKey = GlobalKey();
  final GlobalKey<MyTimerState> timerKey = GlobalKey();

  MyGame({super.key});

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
                      winState: () => statusKey.currentState!.onGameVictory(),
                      loseState: () => statusKey.currentState!.onGameLose(),
                      updateMessage: () =>
                          statusKey.currentState!.updateStatus(),
                      stopWatch: () => timerKey.currentState!.stopTimer(),
                    )),
                const MyResult(),
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
                      action: () => pushOptions(context, const MyResume()),
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

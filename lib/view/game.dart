import 'package:flutter/material.dart';

import 'package:minesweeper/component/input/button.dart';
import 'package:minesweeper/component/input/default.dart';
import 'package:minesweeper/component/game/grille.dart';
import 'package:minesweeper/component/timer.dart';
import 'package:minesweeper/component/status.dart';
import 'package:minesweeper/component/result.dart';

import 'package:provider/provider.dart';
import 'package:minesweeper/provider/manager.dart';

class MyGame extends StatelessWidget {
  final GlobalKey<MyStatusState> statusKey = GlobalKey();
  final GlobalKey<MyTimerState> timerKey = GlobalKey();

  MyGame({super.key});

  final int score = 0;

  @override
  Widget build(BuildContext context) {
    final manager = Provider.of<Manager>(context);

    return Scaffold(
      body: Stack(
        children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                MyStatus(key: statusKey),
                const MyResult(),
                const SizedBox(height: 10),
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
                Column(
                  children: [
                    Container(
                      alignment: Alignment.bottomCenter,
                      child: Text(
                        manager.listeCoups.isNotEmpty
                            ? 'row ${manager.listeCoups.last.coordonnees.ligne + 1}, column ${manager.listeCoups.last.coordonnees.colonne + 1}'
                            : '',
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ),
                  ],
                ),
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
                    const SizedBox(height: 10),
                    MyTimer(key: timerKey),
                    const SizedBox(height: 10),
                    MyButton(
                      action: () {
                        Provider.of<Manager>(context, listen: false).reset();
                        Navigator.popUntil(context, (route) => route.isFirst);
                      },
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

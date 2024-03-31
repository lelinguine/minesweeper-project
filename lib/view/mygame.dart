import 'package:flutter/material.dart';
import 'package:minesweeper/view/component/input/mybutton.dart';
import 'package:minesweeper/view/component/input/mydefaultbutton.dart';
import 'package:minesweeper/view/component/game/mygrille.dart';
import 'package:minesweeper/view/component/mytimer.dart';
import 'package:minesweeper/view/component/mystatus.dart';
import 'package:minesweeper/view/component/myresult.dart';
import 'package:provider/provider.dart';
import 'package:minesweeper/provider/mygamemanager.dart';
import 'package:minesweeper/provider/myusermanager.dart';
import 'package:minesweeper/model/class/score.dart';

class MyGame extends StatelessWidget {
  final GlobalKey<MyStatusState> statusKey = GlobalKey();
  final GlobalKey<MyTimerState> timerKey = GlobalKey();

  MyGame({super.key});

  @override
  Widget build(BuildContext context) {
    final manager = Provider.of<MyGameManager>(context);

    return Scaffold(
      body: Stack(
        children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                MyStatus(key: statusKey),
                MyTimer(key: timerKey),
                const SizedBox(height: 10),
                SizedBox(
                  width: 400,
                  height: 400,
                  child: MyGrille(
                    winState: () => statusKey.currentState!.onGameVictory(),
                    loseState: () => statusKey.currentState!.onGameLose(),
                    updateMessage: () => statusKey.currentState!.updateStatus(),
                    stopWatch: () => timerKey.currentState!.stopTimer(),
                  ),
                ),
                const SizedBox(height: 10),
                Column(
                  children: [
                    Container(
                      alignment: Alignment.bottomCenter,
                      child: Text(
                        manager.listeCoups.isNotEmpty
                            ? '[${manager.listeCoups.last.coordonnees.ligne + 1},${manager.listeCoups.last.coordonnees.colonne + 1}]'
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
                  const MyResult(),
                  const SizedBox(height: 10),
                  MyButton(
                    color: Theme.of(context).secondaryHeaderColor,
                    action: () {
                      _leaveGame(context);
                    },
                    child: const MyDefault(
                      title: 'Leave',
                      icon: 'finish.png',
                      height: 40,
                      width: 400,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _leaveGame(BuildContext context) {
    final manager = Provider.of<MyGameManager>(context, listen: false);
    final userManager = Provider.of<MyUserManager>(context, listen: false);

    if (userManager.current != null) {
      if (manager.score > userManager.current!.score) {
        userManager.setScore(manager.score);
        Provider.of<MyUserManager>(context, listen: false)
            .changeUser(userManager.current!);
      }
      DateTime now = DateTime.now();
      Score score = Score(
        manager.score,
        manager.difficulty,
        '${now.day.toString().padLeft(2, '0')}/${now.month.toString().padLeft(2, '0')}',
        manager.timer,
      );
      userManager.current!.scores.add(score);
    }

    manager.reset();
    Navigator.popUntil(context, (route) => route.isFirst);
  }
}

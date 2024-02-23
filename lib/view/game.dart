import 'package:flutter/material.dart';
import 'package:minesweeper/view/component/input/button.dart';
import 'package:minesweeper/view/component/input/default.dart';
import 'package:minesweeper/view/component/grille.dart';
import 'package:minesweeper/view/component/timer.dart';

import 'package:minesweeper/data/storage.dart';

class MyGame extends StatefulWidget {
  const MyGame({Key? key, required this.difficulty}) : super(key: key);

  final String difficulty;

  @override
  MyGameState createState() => MyGameState();
}

class MyGameState extends State<MyGame> {

  MyStorage storage = MyStorage();

  MyGrille calculateGridDifficulty(String difficulty) {
    if (difficulty == 'Easy') {
      return MyGrille(taille: 4, nbMines: 2);
    } else if (difficulty == 'Medium') {
      return MyGrille(taille: 8, nbMines: 4);
    } else {
      return MyGrille(taille: 12, nbMines: 8);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 400,
                  height: 400,
                  child: calculateGridDifficulty(widget.difficulty),
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
                    const MyTimer(),
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

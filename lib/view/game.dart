import 'package:flutter/material.dart';

import 'package:minesweeper/view/component/input/button.dart';
import 'package:minesweeper/view/component/input/default.dart';
import 'package:minesweeper/view/component/grille.dart';

class MyGame extends StatefulWidget {
  const MyGame({Key? key, required this.difficulty}) : super(key: key);

  final String difficulty;

  @override
  MyGameState createState() => MyGameState();
}

class MyGameState extends State<MyGame> {
  MyGameState();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Center(
            child: MyGrille(),
          ),
          Container(
            margin: const EdgeInsets.only(bottom: 20.0),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: MyButton(
                action: () =>
                    Navigator.popUntil(context, (route) => route.isFirst),
                child: const MyAction(
                  title: 'Finish',
                  icon: 'finish.png',
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

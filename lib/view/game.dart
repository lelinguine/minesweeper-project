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
          Center(child: Container(
              width: 400,
              height: 400,
          // decoration: BoxDecoration(
          //   color: Theme.of(context).primaryColor,
          //   borderRadius: BorderRadius.circular(20),
          //   border: Border.all(
          //     width: 4,
          //     color: Theme.of(context).secondaryHeaderColor,
          //   ),
          //   boxShadow: [
          //     BoxShadow(
          //       color: Theme.of(context).secondaryHeaderColor,
          //       offset: const Offset(4, 4),
          //     ),
          //   ],
          // ),
          child: MyGrille(),
        ),),
          Container(
            margin: const EdgeInsets.only(bottom: 20.0),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: MyButton(
                action: () =>
                    Navigator.popUntil(context, (route) => route.isFirst),
                child: const MyAction(
                  title: 'Leave',
                  icon: 'finish.png',
                  height: 40,
                  width: 400,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

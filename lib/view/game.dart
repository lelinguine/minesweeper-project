import 'package:flutter/material.dart';

import 'package:minesweeper/view/component/button.dart';
import 'package:minesweeper/view/component/action.dart';
import 'package:minesweeper/view/component/grille.dart';

class MyGame extends StatefulWidget {
  const MyGame({Key? key}) : super(key: key);

  @override
  _MyGameState createState() => _MyGameState();
}

class _MyGameState extends State<MyGame> {
  _MyGameState();

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
                    action: () => Navigator.popUntil(context, (route) => route.isFirst),
                    child: MyAction(
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

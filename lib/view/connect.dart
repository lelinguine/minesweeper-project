import 'package:flutter/material.dart';

import 'package:minesweeper/component/input/button.dart';
import 'package:minesweeper/component/input/default.dart';

import 'package:minesweeper/view/navigation.dart';
import 'package:minesweeper/view/home.dart';

class MyConnect extends StatelessWidget {
  const MyConnect({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(bottom: 20.0),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: MyButton(
                action: () => replacementOptions(context, const MyHome()),
                child: const MyAction(
                  title: 'Connect',
                  icon: 'check.png',
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

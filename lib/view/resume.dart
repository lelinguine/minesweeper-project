import 'package:flutter/material.dart';

import 'package:minesweeper/component/input/button.dart';
import 'package:minesweeper/component/input/default.dart';

class MyResume extends StatelessWidget {
  const MyResume({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "test",
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(bottom: 20.0),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: MyButton(
                action: () =>
                    Navigator.popUntil(context, (route) => route.isFirst),
                child: const MyAction(
                  title: 'Ok',
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

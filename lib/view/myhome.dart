import 'package:flutter/material.dart';
import 'package:minesweeper/context.dart';

import 'package:minesweeper/view/component/input/mybutton.dart';
import 'package:minesweeper/view/component/input/mydefaultbutton.dart';
import 'package:minesweeper/view/component/myscore.dart';

import 'package:minesweeper/view/mynavigate.dart';
import 'package:minesweeper/view/myrule.dart';

import 'package:minesweeper/view/component/myuserlist.dart';

class MyHome extends StatelessWidget {
  const MyHome({super.key});

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
                  context.customTitle,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const MyUserList(),
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
                    const MyScore(),
                    const SizedBox(height: 10),
                    MyButton(
                      color: Theme.of(context).secondaryHeaderColor,
                      action: () => pushOptions(context, const MyRule()),
                      child: const MyDefault(
                        title: 'New game',
                        icon: 'start.png',
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

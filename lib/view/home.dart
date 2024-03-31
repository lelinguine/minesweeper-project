import 'package:flutter/material.dart';
import 'package:minesweeper/context.dart';

import 'package:minesweeper/component/input/button.dart';
import 'package:minesweeper/component/input/default.dart';
import 'package:minesweeper/component/score.dart';
import 'package:minesweeper/component/setting.dart';

import 'package:minesweeper/view/navigation.dart';
import 'package:minesweeper/view/rule.dart';
import 'package:minesweeper/view/account.dart';
import 'package:minesweeper/view/connect.dart';

import 'package:provider/provider.dart';
import 'package:minesweeper/provider/user.dart';

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
                _buildWidgetBasedOnConnectionStatus(context),
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

Widget _buildWidgetBasedOnConnectionStatus(BuildContext context) {
  if (!Provider.of<User>(context, listen: false).isConnect) {
    return MyButton(
        child: const MySetting(slot: 'lib/assets/default.jpg', size: 0),
        action: () => pushOptions(context, const MyAccount()));
  } else {
    return MyButton(
        child: const MySetting(slot: '', size: 18),
        action: () => pushOptions(context, const MyConnect()));
  }
}

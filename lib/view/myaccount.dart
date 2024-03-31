import 'package:flutter/material.dart';

import 'package:minesweeper/view/component/input/mybutton.dart';
import 'package:minesweeper/view/component/input/mydeletebutton.dart';
import 'package:minesweeper/view/component/input/myfield.dart';
import 'package:minesweeper/view/component/input/mydefaultbutton.dart';

import 'package:minesweeper/view/component/mysetting.dart';

import 'package:minesweeper/model/class/user.dart';

import 'package:provider/provider.dart';
import 'package:minesweeper/provider/myusermanager.dart';

// ignore: must_be_immutable
class MyAccount extends StatelessWidget {
  MyAccount({super.key, required this.user});

  User user;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: Stack(
        children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(user.pseudo,
                    style: Theme.of(context).textTheme.titleSmall),
                Text("${user.score}pts",
                    style: Theme.of(context).textTheme.bodyMedium),
                const SizedBox(height: 10),
                ...user.scores.map((score) => Text(
                      "${score.date}  ${score.score}pts  ${score.timer / 1000}s  ${score.difficulty}",
                      style: Theme.of(context).textTheme.bodyMedium,
                    )),
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
                    MyButton(
                      color: Theme.of(context).secondaryHeaderColor,
                      action: () => {
                        Provider.of<MyUserManager>(context, listen: false)
                            .changeUser(user),
                        Navigator.pop(context),
                      },
                      child: const MyDefault(
                        title: 'Select',
                        icon: 'check.png',
                        height: 40,
                        width: 400,
                      ),
                    ),
                    const SizedBox(height: 10),
                    MyButton(
                      color: Theme.of(context).secondaryHeaderColor,
                      action: () => {
                        Provider.of<MyUserManager>(context, listen: false)
                            .deleteUser(user),
                        Navigator.pop(context),
                      },
                      child: const MyDeleteButton(
                        title: 'Delete',
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

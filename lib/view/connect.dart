import 'package:flutter/material.dart';

import 'package:minesweeper/component/input/button.dart';
import 'package:minesweeper/component/input/default.dart';

import 'package:minesweeper/view/navigation.dart';
import 'package:minesweeper/view/home.dart';

import 'package:minesweeper/component/input/field.dart';

import 'package:minesweeper/context.dart';

class MyConnect extends StatelessWidget {
  const MyConnect({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: Stack(
        children: [
          Align(
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Account",
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                const SizedBox(height: 80),
                const Text("Login"),
                const MyField(
                  height: 60,
                  width: 400,
                ),
                const Text("Password"),
                const MyField(
                  height: 60,
                  width: 400,
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
                    const Text("Create"),
                    const SizedBox(height: 10),
                    MyButton(
                      action: () => {},
                      child: const MyDefault(
                        title: 'Connect',
                        icon: 'check.png',
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

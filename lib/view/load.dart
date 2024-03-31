import 'dart:async';
import 'package:flutter/material.dart';

import 'package:minesweeper/view/navigation.dart';
import 'package:minesweeper/view/home.dart';

import 'package:minesweeper/component/animate.dart';

class MyLoad extends StatefulWidget {
  const MyLoad({super.key});

  @override
  MyLoadState createState() => MyLoadState();
}

class MyLoadState extends State<MyLoad> with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 1), () {
      replacementOptions(context, const MyHome());
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Stack(
        children: [
          Center(
            child: MyAnimate(),
          ),
        ],
      ),
    );
  }
}

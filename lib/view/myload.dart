import 'dart:async';
import 'package:flutter/material.dart';

import 'package:minesweeper/view/mynavigate.dart';
import 'package:minesweeper/view/myhome.dart';

import 'package:minesweeper/view/component/myanimate.dart';

//storage
// import 'package:minesweeper/data/mystorage.dart';

class MyLoad extends StatefulWidget {
  const MyLoad({super.key});

  @override
  MyLoadState createState() => MyLoadState();
}

class MyLoadState extends State<MyLoad> with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();

    // MyStorage storage = MyStorage();
    // storage.clearLocalStorage();

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

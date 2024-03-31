import 'dart:async';
import 'package:flutter/material.dart';

import 'package:minesweeper/view/navigation.dart';
import 'package:minesweeper/view/home.dart';
import 'package:minesweeper/view/connect.dart';

import 'package:provider/provider.dart';
import 'package:minesweeper/provider/user.dart';

import 'package:minesweeper/component/animate.dart';

class MyLoad extends StatefulWidget {
  const MyLoad({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _MyLoadState createState() => _MyLoadState();
}

class _MyLoadState extends State<MyLoad> with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 2), () {
      if (context.read<User>().isConnect) {
        replacementOptions(context, const MyHome());
        return;
      } else {
        replacementOptions(context, const MyConnect());
        return;
      }
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

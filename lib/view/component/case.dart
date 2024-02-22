import 'package:flutter/material.dart';
import 'package:minesweeper/model/class/case.dart';

class MyCase extends StatelessWidget {
  final Case currentCase;

  const MyCase({Key? key, required this.currentCase}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapUp: (TapUpDetails tapUpDetails) {},
      onTapCancel: () {},
      onTapDown: (TapDownDetails tapDownDetails) {},
      child: Center(
        child: Text(
          currentCase.nbMinesAutour.toString(),
        ),
      ),
    );
  }
}

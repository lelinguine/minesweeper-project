import 'package:flutter/material.dart';

import 'package:minesweeper/view/component/input/button.dart';
import 'package:minesweeper/context.dart';

class MySelect extends StatefulWidget {
  MySelect({
    Key? key,
    required this.buttonKey,
    required this.icon,
    required this.height,
    required this.width,
  }) : super(key: key);

  final String icon;
  final double height, width;
  GlobalKey<MyButtonState> buttonKey = GlobalKey();

  @override
  MySelectState createState() => MySelectState();
}

class MySelectState extends State<MySelect> {
  MySelectState();

  String difficulty = "Easy";
  Color color = Color(int.parse('0xFF06d6a0'));

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        final currentState = widget.buttonKey.currentState;
        if (currentState != null) {
          currentState.updateColor(color);
        }
      }
    });
  }

  Color getColor() {
    return color;
  }

  String getDifficulty() {
    return difficulty;
  }

  void updateDifficulty() {
    setState(() {
      if (difficulty == "Easy") {
        widget.buttonKey.currentState!.updateColor(Color(int.parse('0xFF118ab2')));
        difficulty = "Medium";
      } else if (difficulty == "Medium") {
        widget.buttonKey.currentState!.updateColor(Color(int.parse('0xFFef476f')));
        difficulty = "Hard";
      } else if (difficulty == "Hard") {
        widget.buttonKey.currentState!.updateColor(Color(int.parse('0xFF06d6a0')));
        difficulty = "Easy";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.height,
      width: widget.width,
      child: Stack(
        children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(difficulty,
                    style: Theme.of(context).textTheme.titleMedium),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(right: 10.0),
            child: Align(
              alignment: Alignment.centerRight,
              child: Image.asset(
                context.getAssets() + widget.icon,
                height: 18,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

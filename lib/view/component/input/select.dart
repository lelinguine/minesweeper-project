import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:minesweeper/view/component/input/button.dart';
import 'package:minesweeper/context.dart';

import 'package:minesweeper/model/storage.dart';

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

  MyStorage storage = MyStorage();

  String difficulty = "Easy";
  Color color = const Color(0xFF06d6a0);

  @override
  void initState() {
    super.initState();
    _loadData().then((_) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (mounted) {
          final currentState = widget.buttonKey.currentState;
          if (currentState != null) {
            currentState.updateColor(Color(color.value));
          }
        }
      });
    });
  }

  Future<void> _loadData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      difficulty = prefs.getString('difficulty') ?? "Easy";
      color = Color(prefs.getInt('color') ?? 0xFF06d6a0);
    });
  }

  Future<void> _saveData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('difficulty', difficulty);
    await prefs.setInt('color', color.value);
  }

  String getDifficulty() {
    return difficulty;
  }

  void updateDifficulty() {
    setState(() {
      if (difficulty == "Easy") {
        difficulty = "Medium";
        color = const Color(0xFF118ab2);
      } else if (difficulty == "Medium") {
        difficulty = "Hard";
        color = const Color(0xFFef476f);
      } else if (difficulty == "Hard") {
        difficulty = "Easy";
        color = const Color(0xFF06d6a0);
      }
      widget.buttonKey.currentState!.updateColor(color);
      _saveData();
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

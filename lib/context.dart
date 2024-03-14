import 'package:flutter/material.dart';

extension MyContextExtension on BuildContext {
  String get customTitle => 'Minesweeper';
  String get customRule =>
      'In Minesweeper, tap on grid cells to reveal whether they contain mines or not. If a cell contains a mine, the game ends. Otherwise, the cell shows a number indicating how many adjacent cells contain mines. Use logic to deduce the locations of mines and mark with a long press them with flags to avoid clicking on them. Clear the entire grid without detonating any mines.';

  bool isDark() {
    return MediaQuery.of(this).platformBrightness == Brightness.light;
  }

  String getAssets() {
    String assets = 'lib/assets/';
    if (isDark()) {
      return '${assets}dark/';
    }
    return '${assets}light/';
  }
}

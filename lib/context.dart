import 'package:flutter/material.dart';

extension MyContextExtension on BuildContext {
  String get customTitle => 'Minesweeper';
  String get customRule =>
      'In Minesweeper, players click on grid cells to reveal whether they contain mines or not. If a cell contains a mine, the game ends. Otherwise, the cell shows a number indicating how many adjacent cells contain mines. Players must use logic to deduce the locations of mines and mark them with flags to avoid clicking on them. The goal is to clear the entire grid without detonating any mines.';

  bool isDark() {
    return MediaQuery.of(this).platformBrightness == Brightness.dark;
  }

  String getAssets() {
    String assets = 'lib/assets/';
    if (isDark()) {
      return '${assets}dark/';
    }
    return '${assets}light/';
  }
}

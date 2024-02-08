import 'package:flutter/material.dart';

extension MyContextExtension on BuildContext {
  String get customTitle => 'Minesweeper';

  bool isDark() {
    // return MediaQuery.of(this).platformBrightness == Brightness.light;
    return false;
  }

  String getAssets() {
    String assets = 'lib/assets/';
    // if (isDark()) {
    //   return '${assets}dark/';
    // }
    return assets;
  }
}
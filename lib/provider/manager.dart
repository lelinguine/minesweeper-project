import 'package:flutter/material.dart';

import 'package:minesweeper/data/storage.dart';

class Manager extends ChangeNotifier {
  MyStorage storage = MyStorage();

  int score = 0;
  int coup = 0;
  int timer = 0;

  String difficulty = 'Easy';
  Color color = const Color(0xFF06d6a0);

  Manager() {
    loadDifficulty();
  }

  // score
  void reset() {
    storage.saveStorageInt('score', score);
    score = 0;
    coup = 0;
    timer = 0;
  }

  void incrementCoup() {
    coup++;
    score = coup * timer;
    notifyListeners();
  }

  // difficulty
  void loadDifficulty() {
    storage.loadStorageString('difficulty').then((value) {
      difficulty = value == '' ? 'Easy' : value;
      notifyListeners();
    });

    storage.loadStorageInt('color').then((value) {
      color = value == 0 ? const Color(0xFF06d6a0) : Color(value);
      notifyListeners();
    });
  }

  void updateDifficulty() {
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
    storage.saveStorageString('difficulty', difficulty);
    storage.saveStorageInt('color', color.value);
    notifyListeners();
  }
}

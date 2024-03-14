import 'package:flutter/material.dart';

import 'package:minesweeper/data/storage.dart';

class Game extends ChangeNotifier {
  MyStorage storage = MyStorage();

  int score = 0;
  int timer = 1;
  int mul = 1;
  String difficulty = 'Easy';
  Color color = const Color(0xFF06d6a0);

  Game() {
    loadDifficulty();
  }

  // score
  void reset() {
    score = 0;
  }

  void saveScore() {
    storage.saveStorageInt('score', score);
  }

  void updateScore() {
    score++;
    notifyListeners();
  }

  int getScore() {
    return score;
  }

  void setScore(int value) {
    score = value * mul * timer;
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

  String getDifficulty() {
    return difficulty;
  }

  void setDifficulty(String value) {
    difficulty = value;
    notifyListeners();
  }
}

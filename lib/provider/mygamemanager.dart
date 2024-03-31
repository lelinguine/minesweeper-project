import 'package:flutter/material.dart';
import 'dart:math';

import 'package:minesweeper/data/mystorage.dart';

import 'package:minesweeper/model/class/coup.dart';

class MyGameManager extends ChangeNotifier {
  MyStorage storage = MyStorage();

  int score = 0;
  int best = 0;
  double timer = 0;

  String difficulty = 'Easy';
  Color color = const Color(0xFF06d6a0);

  int nbMines = 0;
  int taille = 0;

  List<Coup> listeCoups = [];

  MyGameManager() {
    loadDifficulty();
  }

  // score
  void reset() {
    if (score > best) {
      best = score;
      storage.saveStorageInt('score', score);
    }
    score = 0;
    timer = 0;
    listeCoups.clear();
    notifyListeners();
  }

  void setScore() {
    double coeffTempsParCase =
        max(1.0, 10000.0 - timer / (taille * taille - nbMines).toDouble());
    double coeffDifficulte =
        100.00 * nbMines.toDouble() / (taille * taille).toDouble();
    score = ((taille * taille - nbMines).toDouble() *
            coeffTempsParCase /
            100.0 *
            coeffDifficulte)
        .toInt();
    notifyListeners();
  }

  void addMove(Coup coup) {
    listeCoups.add(coup);
    setScore();
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

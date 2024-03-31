import 'package:minesweeper/model/class/score.dart';

class User {
  String pseudo;
  int score;
  List<Score> scores;

  User(this.pseudo)
      : score = 0,
        scores = [];
}

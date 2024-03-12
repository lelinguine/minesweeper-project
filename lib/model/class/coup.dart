import 'package:minesweeper/model/class/case.dart';

/// [Actionn] qu'on peut jouer sur une [Case]
enum Actionn { decouvrir, marquer }

/// [Coup] joué
class Coup {
  Coordonnees coordonnees;
  Actionn action;

  Coup(int lig, int col, this.action)
      : coordonnees = (ligne: lig, colonne: col);
}

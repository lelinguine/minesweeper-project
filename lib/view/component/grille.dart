import 'package:flutter/material.dart';
import 'dart:math';
import 'package:minesweeper/view/component/case.dart';
import 'package:minesweeper/model/class/grille.dart';
import 'package:minesweeper/model/class/case.dart';
import 'package:minesweeper/model/class/coup.dart';

class MyGrille extends StatefulWidget {
  final String difficulty;
  final VoidCallback winState;
  final VoidCallback loseState;
  final VoidCallback stopWatch;

  const MyGrille(
      {super.key,
      required this.difficulty,
      required this.winState,
      required this.loseState,
      required this.stopWatch});

  @override
  MyGrilleState createState() => MyGrilleState();
}

class MyGrilleState extends State<MyGrille> {
  late Grille grille;
  late int taille, nbMines;
  late bool isFinie = false;

  @override
  void initState() {
    super.initState();
    if (widget.difficulty == 'Easy') {
      taille = 4;
      nbMines = 1;
    } else if (widget.difficulty == 'Medium') {
      taille = 8;
      nbMines = 4;
    } else {
      taille = 8;
      nbMines = 8;
    }
    grille = Grille(taille: taille, nbMines: nbMines);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          width: 2,
          color: Theme.of(context).secondaryHeaderColor,
        ),
      ),
      child: GridView.builder(
        itemCount: pow(taille, 2).toInt(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: taille,
        ),
        itemBuilder: (context, index) {
          int row = (index / taille).floor();
          int col = index % taille;
          Coordonnees coord = (ligne: row, colonne: col);
          Case currentCase = grille.getCase(coord);
          return MyCase(
            currentCase: currentCase,
            onTap: () {
              _onCaseTap(row, col, Actionn.decouvrir);
            },
            onPressed: () {
              _onCaseTap(row, col, Actionn.marquer);
            },
            isFirstRow: row == 0,
            isLastRow: row == taille - 1,
            isFirstColumn: col == 0,
            isLastColumn: col == taille - 1,
          );
        },
      ),
    );
  }

  void _onCaseTap(int row, int col, Actionn action) {
    setState(() {
      if (!isFinie) {
        Coordonnees coord = (ligne: row, colonne: col);
        Coup coup = Coup(row, col, action);
        Case tappedCase = grille.getCase(coord);

        if (action == Actionn.marquer && tappedCase.etat != Etat.decouverte) {
          tappedCase.etat = Etat.marquee;
        } else if (action == Actionn.decouvrir &&
            tappedCase.etat != Etat.marquee) {
          tappedCase.etat = Etat.decouverte;

          grille.decouvrirVoisines(coord);
        }

        if (grille.isPerdue(coup)) {
          widget.stopWatch();
          widget.loseState();
          isFinie = true;
        } else {
          if (grille.isGagnee()) {
            widget.stopWatch();
            widget.winState();
            isFinie = true;
          }
        }
      }
    });
  }
}

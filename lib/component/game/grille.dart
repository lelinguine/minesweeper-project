import 'package:flutter/material.dart';
import 'dart:math';
import 'package:minesweeper/component/game/case.dart';
import 'package:minesweeper/model/class/grille.dart';
import 'package:minesweeper/model/class/case.dart';
import 'package:minesweeper/model/class/coup.dart';

import 'package:provider/provider.dart';
import 'package:minesweeper/provider/manager.dart';

class MyGrille extends StatefulWidget {
  final VoidCallback winState;
  final VoidCallback loseState;
  final VoidCallback updateMessage;
  final VoidCallback stopWatch;

  const MyGrille(
      {super.key,
      required this.winState,
      required this.loseState,
      required this.updateMessage,
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

    String difficulty = Provider.of<Manager>(context, listen: false).difficulty;
    if (difficulty == 'Easy') {
      taille = 4;
      nbMines = 2;
    } else if (difficulty == 'Medium') {
      taille = 6;
      nbMines = 4;
    } else {
      taille = 8;
      nbMines = 12;
    }
    Provider.of<Manager>(context, listen: false).nbMines = nbMines;
    Provider.of<Manager>(context, listen: false).taille = taille;
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
        // boxShadow: [
        //   BoxShadow(
        //     color: Theme.of(context).secondaryHeaderColor,
        //     offset: const Offset(4, 4),
        //   ),
        // ],
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
        widget.updateMessage();
        Coordonnees coord = (ligne: row, colonne: col);
        Coup coup = Coup(row, col, action);
        Case tappedCase = grille.getCase(coord);

        if (tappedCase.etat == Etat.couverte) {
          Provider.of<Manager>(context, listen: false).addMove(coup);
        }

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

import 'package:flutter/material.dart';
import 'dart:math';
import 'package:minesweeper/view/component/case.dart';
import 'package:minesweeper/model/class/grille.dart';
import 'package:minesweeper/model/class/case.dart';
import 'package:minesweeper/model/class/coup.dart';

class MyGrille extends StatefulWidget {
  final int taille, nbMines;
  // final VoidCallback onGameState;

  const MyGrille({super.key, required this.taille, required this.nbMines});

  @override
  MyGrilleState createState() => MyGrilleState();
}

class MyGrilleState extends State<MyGrille> {
  late Grille grille;

  @override
  void initState() {
    super.initState();
    grille = Grille(taille: widget.taille, nbMines: widget.nbMines);
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
        itemCount: pow(widget.taille, 2).toInt(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: widget.taille,
        ),
        itemBuilder: (context, index) {
          int row = (index / widget.taille).floor();
          int col = index % widget.taille;
          Coordonnees coord = (ligne: row, colonne: col);
          Case currentCase = grille.getCase(coord);
          return MyCase(
            currentCase: currentCase,
            onTap: () {
              _onCaseTap(row, col);
            },
            isFirstRow: row == 0,
            isLastRow: row == widget.taille - 1,
            isFirstColumn: col == 0,
            isLastColumn: col == widget.taille - 1,
          );
        },
      ),
    );
  }

  void _onCaseTap(int row, int col) {
    setState(() {
      Coordonnees coord = (ligne: row, colonne: col);

      Coup coup = Coup(row, col, Actionn.decouvrir);

      grille.decouvrirVoisines(coord);

      if (grille.isFinie(coup)) {
        print("Partie finie");
      } else {
        print("Partie en cours...");
      }

      Case tappedCase = grille.getCase(coord);
      tappedCase.etat = Etat.decouverte;
    });
  }
}

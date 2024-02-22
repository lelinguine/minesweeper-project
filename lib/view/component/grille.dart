import 'package:flutter/material.dart';
import 'dart:math';
import 'package:minesweeper/view/component/case.dart';
import 'package:minesweeper/model/class/grille.dart';
import 'package:minesweeper/model/class/case.dart';

class MyGrille extends StatelessWidget {
  final int taille, nbMines;

  MyGrille({Key? key, required this.taille, required this.nbMines}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Grille grille = Grille(taille: taille, nbMines: 10);

    return GridView.builder(
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
        );
      },
    );
  }
}

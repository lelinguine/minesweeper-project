import 'package:flutter/material.dart';
import 'dart:math';
import 'package:minesweeper/view/component/case.dart';
import 'package:minesweeper/model/class/grille.dart';
import 'package:minesweeper/model/class/case.dart';

class MyGrille extends StatelessWidget {
  final int taille, nbMines;

  const MyGrille({super.key, required this.taille, required this.nbMines});

  @override
  Widget build(BuildContext context) {
    Grille grille = Grille(taille: taille, nbMines: nbMines);

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
          return _buildCaseWidget(context, currentCase, row, col);
        },
      ),
    );
  }

  Widget _buildCaseWidget(
      BuildContext context, Case currentCase, int row, int col) {
    BorderRadius borderRadius;

    if (row == 0 && col == 0) {
      borderRadius = const BorderRadius.only(
        topLeft: Radius.circular(18),
      );
    } else if (row == 0 && col == taille - 1) {
      borderRadius = const BorderRadius.only(
        topRight: Radius.circular(18),
      );
    } else if (row == taille - 1 && col == 0) {
      borderRadius = const BorderRadius.only(
        bottomLeft: Radius.circular(18),
      );
    } else if (row == taille - 1 && col == taille - 1) {
      borderRadius = const BorderRadius.only(
        bottomRight: Radius.circular(18),
      );
    } else {
      borderRadius = BorderRadius.zero;
    }

    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
        border: Border.all(
          width: 2,
          color: Theme.of(context).secondaryHeaderColor,
        ),
        borderRadius: borderRadius,
      ),
      child: MyCase(
        currentCase: currentCase,
      ),
    );
  }
}

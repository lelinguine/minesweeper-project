import 'package:flutter/material.dart';
import 'package:minesweeper/model/class/case.dart';

class MyCase extends StatelessWidget {
  final Case currentCase;

  const MyCase({Key? key, required this.currentCase}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapUp: (TapUpDetails tapUpDetails) {},
      onTapCancel: () {},
      onTapDown: (TapDownDetails tapDownDetails) {},
      child: Center(
        child: _buildContent(),
      ),
    );
  }

  Widget _buildContent() {
    if (currentCase.etat == Etat.decouverte) {
      // Si la case est découverte
      if (currentCase.minee) {
        // Si la case est minée
        return Icon(Icons.dangerous); // Afficher une icône de mine
      } else {
        return Text(
          currentCase.nbMinesAutour.toString(),
          style: TextStyle(fontSize: 20),
        ); // Afficher le nombre de mines autour
      }
    } else {
      return Container(); // Case non découverte, ne rien afficher
    }
  }
}

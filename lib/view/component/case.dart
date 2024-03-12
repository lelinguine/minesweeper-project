import 'package:flutter/material.dart';
import 'package:minesweeper/model/class/case.dart';

class MyCase extends StatelessWidget {
  final Case currentCase;
  final VoidCallback onTap;
  final bool isFirstRow;
  final bool isLastRow;
  final bool isFirstColumn;
  final bool isLastColumn;

  const MyCase({
    super.key,
    Key? widgetKey,
    required this.currentCase,
    required this.onTap,
    required this.isFirstRow,
    required this.isLastRow,
    required this.isFirstColumn,
    required this.isLastColumn,
  });

  @override
  Widget build(BuildContext context) {
    BorderRadius borderRadius = BorderRadius.zero;

    if (isFirstRow && isFirstColumn) {
      borderRadius = const BorderRadius.only(
        topLeft: Radius.circular(18),
      );
    } else if (isFirstRow && isLastColumn) {
      borderRadius = const BorderRadius.only(
        topRight: Radius.circular(18),
      );
    } else if (isLastRow && isFirstColumn) {
      borderRadius = const BorderRadius.only(
        bottomLeft: Radius.circular(18),
      );
    } else if (isLastRow && isLastColumn) {
      borderRadius = const BorderRadius.only(
        bottomRight: Radius.circular(18),
      );
    }

    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
          border: Border.all(
            width: 2,
            color: Theme.of(context).secondaryHeaderColor,
          ),
          borderRadius: borderRadius,
        ),
        child: Center(
          child: _buildContent(),
        ),
      ),
    );
  }

  Widget _buildContent() {
    Color textColor = Colors.black;
    int nbMines = currentCase.nbMinesAutour;
    if (currentCase.etat == Etat.decouverte) {
      if (currentCase.minee) {
        return const Icon(Icons.dangerous);
      } else {
        if (nbMines > 0) {
          if (nbMines == 1) {
            textColor = const Color(0xFF06d6a0);
          } else if (nbMines == 2) {
            textColor = const Color(0xFF118ab2);
          } else {
            textColor = const Color(0xFFef476f);
          }
        }
        return Text(
          nbMines.toString(),
          style: TextStyle(fontSize: 20, color: textColor),
        );
      }
    } else {
      return Container();
    }
  }
}

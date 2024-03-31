import 'package:flutter/material.dart';
import 'package:minesweeper/context.dart';

class MySetting extends StatelessWidget {
  const MySetting({super.key, required this.slot, required this.size});

  final String slot;
  final double size;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 40,
        width: 40,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ClipOval(
                child: Image.asset(
                  (slot == "") ? "${context.getAssets()}plus.png" : slot,
                  width: (size == 0) ? 40 : size,
                  height: (size == 0) ? 40 : size,
                ),
              ),
            ],
          ),
        ));
  }
}

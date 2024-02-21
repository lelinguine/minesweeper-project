import 'package:flutter/material.dart';
import 'package:minesweeper/view/component/case.dart';

class MyGrille extends StatelessWidget {
  const MyGrille({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        itemCount: 10*10,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 10,
        ),
        itemBuilder: (context, index) {
          return const MyCase();
        },
      
    );
  }
}
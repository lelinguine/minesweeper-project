import 'package:flutter/material.dart';
import 'package:minesweeper/view/component/case.dart';

class MyGrille extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.builder(
        itemCount: 16,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
        ),
        itemBuilder: (context, index) {
          return Container(
            child: MyCase()
          );
        },
      ),
    );
  }
}

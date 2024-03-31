import 'package:flutter/material.dart';
import 'package:minesweeper/context.dart';

class MyLogout extends StatelessWidget {
  const MyLogout({
    super.key,
    required this.title,
    required this.icon,
    required this.height,
    required this.width,
  });

  final String title, icon;
  final double height, width;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: Container(
        height: height,
        width: width,
        color: const Color(0xFFef476f),
        child: Stack(
          children: [
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(title, style: Theme.of(context).textTheme.titleSmall),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(right: 10.0),
              child: Align(
                alignment: Alignment.centerRight,
                child: Image.asset(
                  context.getAssets() + icon,
                  height: 18,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

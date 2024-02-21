import 'package:flutter/material.dart';

class MyCase extends StatelessWidget {
  const MyCase({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
            onTapUp: (TapUpDetails tapUpDetails) {
            },
            onTapCancel: () {
            },
            onTapDown: (TapDownDetails tapDownDetails) {
            },
            child: const Center(child: Text('1')));
  }
}
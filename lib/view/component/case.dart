// ignore_for_file: library_private_types_in_public_api, no_logic_in_create_state

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
            child: const Text('1'));
  }
}
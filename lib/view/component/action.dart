import 'package:flutter/material.dart';

class MyAction extends StatelessWidget {
  const MyAction({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 30,
      width: 50,
      child: Center(
          child: Text("OK",
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyMedium)),
    );
  }
}

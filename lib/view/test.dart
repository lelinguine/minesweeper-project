import 'package:flutter/material.dart';

class MyTest extends StatelessWidget {
  const MyTest({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Text(
          'Test',
          style: Theme.of(context).textTheme.titleMedium,
        ),
      ]),
    );
  }
}

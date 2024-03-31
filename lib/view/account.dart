import 'package:flutter/material.dart';

import 'package:minesweeper/component/input/button.dart';
import 'package:minesweeper/component/input/default.dart';
import 'package:minesweeper/component/input/logout.dart';

// import 'package:provider/provider.dart';
// import 'package:minesweeper/provider/user.dart';

class MyAccount extends StatelessWidget {
  const MyAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: Stack(
        children: [
          Container(
            margin: const EdgeInsets.only(bottom: 20.0),
            child: Align(
                alignment: Alignment.bottomCenter,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // MyButton(
                    //   action: () => {},
                    //   child: const MyDefault(
                    //     title: 'Save',
                    //     icon: 'check.png',
                    //     height: 40,
                    //     width: 400,
                    //   ),
                    // ),
                    // const SizedBox(height: 10),
                    // MyButton(
                    //   action: () => {},
                    //   child: const MyLogout(
                    //     title: 'Logout',
                    //     icon: 'finish.png',
                    //     height: 40,
                    //     width: 400,
                    //   ),
                    // ),
                  ],
                )),
          ),
        ],
      ),
    );
  }
}

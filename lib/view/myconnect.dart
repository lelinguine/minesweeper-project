import 'package:flutter/material.dart';

import 'package:minesweeper/view/component/input/mybutton.dart';
import 'package:minesweeper/view/component/input/mydefaultbutton.dart';
import 'package:minesweeper/view/component/input/myfield.dart';

import 'package:minesweeper/model/class/user.dart';

import 'package:provider/provider.dart';
import 'package:minesweeper/provider/myusermanager.dart';

class MyConnect extends StatelessWidget {
  const MyConnect({Key? key});

  @override
  Widget build(BuildContext context) {
    TextEditingController _pseudoController =
        TextEditingController(); // Contrôleur de texte pour récupérer le texte saisi

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: Stack(
        children: [
          Align(
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Choose your pseudonym!",
                  style: Theme.of(context).textTheme.titleSmall,
                ),
                const SizedBox(height: 10),
                MyField(
                  height: 60,
                  width: 400,
                  controller:
                      _pseudoController, // Passez le contrôleur de texte à MyField
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(bottom: 20.0),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  MyButton(
                    color: Theme.of(context).secondaryHeaderColor,
                    action: () {
                      // Récupérer le texte saisi dans le contrôleur de texte
                      String pseudo = _pseudoController.text;

                      final userManager =
                          Provider.of<MyUserManager>(context, listen: false);
                      if (pseudo.isNotEmpty) {
                        // Ajouter l'utilisateur à MyUserManager
                        Provider.of<MyUserManager>(context, listen: false)
                            .addUser(pseudo);

                        Provider.of<MyUserManager>(context, listen: false)
                            .changeUser(userManager.current!);

                        // Fermer l'écran de connexion
                        Navigator.pop(context);
                      }
                    },
                    child: const MyDefault(
                      title: 'Add',
                      icon: 'check.png',
                      height: 40,
                      width: 400,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

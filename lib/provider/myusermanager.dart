import 'package:flutter/material.dart';
import 'package:minesweeper/model/class/user.dart';

import 'package:minesweeper/data/mystorage.dart';

class MyUserManager extends ChangeNotifier {
  MyStorage storage = MyStorage();

  int score = 0;
  late User? current = null;
  List<User> listUsers = [];

  MyUserManager() {
    loadUsers();

    notifyListeners();
  }

  void loadUsers() {
    storage.loadStorageString('users').then((pseudoValue) {
      storage.loadStorageString('scores').then((scoreValue) {
        if (pseudoValue.isNotEmpty && scoreValue.isNotEmpty) {
          var pseudos = pseudoValue.split(',');
          var scores = scoreValue.split(',');
          if (pseudos.length == scores.length) {
            for (var i = 0; i < pseudos.length; i++) {
              var pseudo = pseudos[i];
              var score = int.parse(scores[i]);
              listUsers.add(User(pseudo)..score = score);
            }
          }
        }
        if (listUsers.isEmpty) {
          addUser("default");
        }
        storage.loadStorageString('current').then((value) {
          if (value.isNotEmpty) {
            current = listUsers.firstWhere((element) => element.pseudo == value,
                orElse: () => User(""));
            score = current!.score;
          } else {
            current = null;
            score = 0;
          }
          notifyListeners();
        });
      });
    });
  }

  void saveUsers() {
    var pseudos = listUsers.map((user) => user.pseudo).join(',');
    var scores = listUsers.map((user) => user.score.toString()).join(',');

    storage.saveStorageString('users', pseudos);
    storage.saveStorageString('scores', scores);
    storage.saveStorageString('current', current?.pseudo ?? '');
  }

  void setScore(int score) {
    current!.score = score;
    saveUsers();
    notifyListeners();
  }

  void addUser(String pseudo) {
    User user = User(pseudo);
    listUsers.add(user);
    current = user;
    saveUsers();
    notifyListeners();
  }

  void changeUser(User user) {
    current = user;
    score = current!.score;
    saveUsers();
    notifyListeners();
  }

  void deleteUser(User user) {
    listUsers.remove(user);
    if (listUsers.isEmpty) {
      addUser("default");
      score = 0;
    } else {
      current = listUsers[0];
      score = current!.score;
    }
    saveUsers();
    notifyListeners();
  }
}

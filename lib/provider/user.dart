import 'package:flutter/material.dart';

class User extends ChangeNotifier {
  bool isConnect = false;
  String pseudo = '';
  String email = '';
  String password = '';
  String image = '';

  User();
}

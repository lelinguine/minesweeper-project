import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyStorage with ChangeNotifier {
  Future<void> saveStorageInt(String setting, int value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt(setting, value);
  }

  Future<void> saveStorageString(String setting, String value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(setting, value);
  }

  Future<int> loadStorageInt(String setting) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getInt(setting) ?? 0;
  }

  Future<String> loadStorageString(String setting) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(setting) ?? '';
  }

  Future<void> clearLocalStorage() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }
}

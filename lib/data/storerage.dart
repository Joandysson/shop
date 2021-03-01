import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class Storage {
  static Future<void> saveString(String key, String value) async {
    final perfs = await SharedPreferences.getInstance();
    perfs.setString(key, value);
  }

  static Future<void> savaMap(String key, Map<String, dynamic> value) async {
    saveString(key, json.encode(value));
  }

  static Future<String> getString(String key) async {
    final perfs = await SharedPreferences.getInstance();
    return perfs.getString(key);
  }

  static Future<Map<String, dynamic>> getMap(String key) async {
    try {
      Map<String, dynamic> map = json.decode(await getString(key));
      return map;
    } catch (e) {
      return null;
    }
  }

  static Future<bool> remove(String key) async {
    final perfs = await SharedPreferences.getInstance();
    return perfs.remove(key);
  }
}

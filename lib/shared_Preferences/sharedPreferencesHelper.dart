// ignore_for_file: camel_case_types, unused_import, file_names

import 'package:shared_preferences/shared_preferences.dart';

class Cache {
  late SharedPreferences sharedPreferences;

  // Initialize shared preferences
  Future<void> cacheInitialization() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  //set string value
  Future<bool> setString(String key, String value) async {
    return await sharedPreferences.setString(key, value);
  }

  // Save a String value
  Future<void> saveString(String key, String value) async {
    await sharedPreferences.setString(key, value);
  }

  // Get a String value
  String? getString(String key) {
    return sharedPreferences.getString(key);
  }

  // Save an int value
  Future<void> saveInt(String key, int value) async {
    await sharedPreferences.setInt(key, value);
  }

  // Get an int value
  int? getInt(String key) {
    return sharedPreferences.getInt(key);
  }

  // Save a bool value
  Future<void> saveBool(String key, bool value) async {
    await sharedPreferences.setBool(key, value);
  }

  // Get a bool value
  bool? getBool(String key) {
    return sharedPreferences.getBool(key);
  }

  // Save a double value
  Future<void> saveDouble(String key, double value) async {
    await sharedPreferences.setDouble(key, value);
  }

  // Get a double value
  double? getDouble(String key) {
    return sharedPreferences.getDouble(key);
  }

  // Save the token
  Future<void> saveToken(String token) async {
    await sharedPreferences.setString('token', token);
  }

  // Get the token
  String? getToken() {
    return sharedPreferences.getString('token');
  }

  // Remove the token
  Future<void> removeToken() async {
    await sharedPreferences.remove('token');
  }

  // Remove a value
  Future<void> removeValue(String key) async {
    await sharedPreferences.remove(key);
  }

  // Clear all values
  Future<void> clearAll() async {
    await sharedPreferences.clear();
  }
}

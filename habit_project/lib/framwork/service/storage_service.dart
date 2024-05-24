import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class StorageService {
  Future<void> initialize() async {
    _sharedPreferences = await SharedPreferences.getInstance();
  }

  SharedPreferences? _sharedPreferences;
  StorageService._internal();
  static StorageService? instance;
  factory StorageService() {
    instance ??= StorageService._internal();
    return instance!;
  }

  String? getString(String key) {
    return _sharedPreferences!.getString(key) ?? '';
  }

  Future<bool> setString(String key, String value) async {
    return await _sharedPreferences!.setString(key, value);
  }

  int? getInt(String key) {
    return _sharedPreferences!.getInt(key);
  }

  Future<bool> setInt(String key, int value) async {
    return await _sharedPreferences!.setInt(key, value);
  }

  double getDouble(String key) {
    return _sharedPreferences!.getDouble(key) ?? 0.0;
  }

  Future<bool> setDouble(String key, double value) async {
    return await _sharedPreferences!.setDouble(key, value);
  }

  bool getBool(String key) {
    return _sharedPreferences!.getBool(key) ?? false;
  }

  Future<bool> setBool(String key, bool value) async {
    return await _sharedPreferences!.setBool(key, value);
  }

  List<String> getStringList(String key) {
    return _sharedPreferences!.getStringList(key) ?? [];
  }

  Future<bool> setStringList(String key, List<String> value) async {
    return await _sharedPreferences!.setStringList(key, value);
  }

  Future<bool> remove(String key) async {
    return await _sharedPreferences!.remove(key);
  }

  Future setObject(String key, dynamic object) async {
    return await _sharedPreferences!.setString(key, json.encode(object));
  }

  dynamic getObject(String key) {
    final decodedObject = _sharedPreferences!.getString(key);
    return decodedObject != null ? json.decode(decodedObject) : null;
  }

  Future<bool> clear() async {
    return await _sharedPreferences!.clear();
  }
}

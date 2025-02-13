import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class PreferencesManager {
  static SharedPreferences? _prefs;

  static Future<void> _ensureInitialized() async {
    _prefs ??= await SharedPreferences.getInstance();
  }

  static Future<void> save(String key, dynamic value) async {
    await _ensureInitialized();
    if (_prefs == null) return;

    if (value is bool) {
      await _prefs!.setBool(key, value);
    } else if (value is int) {
      await _prefs!.setInt(key, value);
    } else if (value is double) {
      await _prefs!.setDouble(key, value);
    } else if (value is String) {
      await _prefs!.setString(key, value);
    } else {
      throw ArgumentError('Unsupported value type');
    }
  }

  static dynamic load(String key, {dynamic defaultValue}) async {
    await _ensureInitialized();
    return _prefs!.get(key) ?? defaultValue;
  }

  static Future<void> saveJson(String key, dynamic jsonData) async {
    await _ensureInitialized();
    await _prefs!.setString(key, jsonEncode(jsonData));
  }

  static dynamic loadJson(String key, {dynamic defaultValue}) async {
    await _ensureInitialized();
    final jsonString = _prefs!.getString(key);
    return jsonString != null ? jsonDecode(jsonString) : defaultValue;
  }
}

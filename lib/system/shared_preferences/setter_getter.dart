import 'package:shared_preferences/shared_preferences.dart';

import 'shared_preferences_manager.dart';

class SharedPreferencesSetterGetter {
  static Future<void> setIntValue(SharedPreferences prefs, SharedPreferencesKeys key, dynamic value) async {
    if (value == null) return;
    int? i = value is String ? int.tryParse(value) : value;
    if (i == null) {
      return;
    }
    await prefs.setInt(key.key, i);
  }

  static Future<void> setStringValue(SharedPreferences prefs, SharedPreferencesKeys key, dynamic value) async {
    if (value == null) return;
    await prefs.setString(key.key, value.toString());
  }

  static Future<void> setBoolValue(SharedPreferences prefs, SharedPreferencesKeys key, dynamic value) async {
    if (value == null) return;
    if (value is bool) {
      await prefs.setBool(key.key, value);
    }
  }

  static int getIntValue(SharedPreferences prefs, SharedPreferencesKeys key) {
    final value = prefs.getInt(key.key);
    return value ?? 0;
  }

  static String getStringValue(SharedPreferences prefs, SharedPreferencesKeys key) {
    final value = prefs.getString(key.key);
    return value ?? '';
  }

  static bool getBoolValue(SharedPreferences prefs, SharedPreferencesKeys key) {
    final value = prefs.getBool(key.key);
    return value ?? false;
  }
}
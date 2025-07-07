import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage {
  static SharedPreferences? _prefs;

  static Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  static List<String> getStrings(String key) =>
      _prefs?.getStringList(key) ?? [];

  static Future<bool> setStrings(String key, List<String>? data) async {
    return await _prefs?.setStringList(key, data ?? []) ?? false;
  }

  static Future<bool> setInt(String key, int? data) async {
    return await _prefs?.setInt(key, data ?? -1) ?? false;
  }

  static Future<bool> setString(String key, String data) async {
    return await _prefs?.setString(key, data) ?? false;
  }

  static String getString(String key) => _prefs?.getString(key) ?? '';

  static int getInt(String key) => _prefs?.getInt(key) ?? -1;

  static Future<bool?> removeKey(String key) async => await _prefs?.remove(key);
}

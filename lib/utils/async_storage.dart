import 'package:shared_preferences/shared_preferences.dart';

String _storageVersion = 'v1';

_getVersionedKey(String key) {
  return _storageVersion + '@@' + key;
}

class AsyncStorage {
  static saveStringData(String key, String value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(_getVersionedKey(key), value);
  }

  static getStringData(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.get(_getVersionedKey(key));
  }

  static clear(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove(_getVersionedKey(key));
  }
}

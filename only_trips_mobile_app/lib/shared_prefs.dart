import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefs {

  SharedPreferences _sharedPrefs;

  init() async {
    if (_sharedPrefs == null) {
      _sharedPrefs = await SharedPreferences.getInstance();
    }
  }

  bool get isDarkMode => _sharedPrefs.getBool(is_dark) ?? false;

  set isDarkMode(bool value) {
    _sharedPrefs.setBool(is_dark, value);
  }

  String get email => _sharedPrefs.getString(keyEmail) ?? "";

  set email(String value) {
    _sharedPrefs.setString(keyEmail, value);
  }

  String get userId => _sharedPrefs.getString(key_uuid) ?? "";

  set userId(String value) {
    _sharedPrefs.setString(key_uuid, value);
  }
}

final sharedPrefs = SharedPrefs();
const String keyEmail = "key_email";
const String key_uuid = "key_uuid";
const String is_dark = "is_dark";
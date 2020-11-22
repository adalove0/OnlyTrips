import 'dart:convert';
import 'login_classes.dart';
import 'package:onlytrips/themes.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefs {
  SharedPreferences _sharedPrefs;

  init() async {
    if (_sharedPrefs == null) {
      _sharedPrefs = await SharedPreferences.getInstance();
    }
  }

  void clear(ThemeNotifier themeNotifier) async {
    await _sharedPrefs.clear();
    themeNotifier.setTheme(lightTheme);
    _sharedPrefs.reload();
  }

  bool get isLoggedIn => _sharedPrefs.getBool(is_logged_in) ?? false;
  set isLoggedIn(bool value) {
    _sharedPrefs.setBool(is_logged_in, value);
  }

  bool get isDarkMode => _sharedPrefs.getBool(is_dark) ?? false;
  set isDarkMode(bool value) {
    _sharedPrefs.setBool(is_dark, value);
  }

  User get currUser {
    var encoded = _sharedPrefs.getString(keyUser);
    var decoded = json.decode(encoded);
    User.fromJson(decoded);
  }
  // User get currUser => (json.decode(_sharedPrefs.getString(keyUser))) ?? null;
  set currUser(User input) {
    var encoded = json.encode(input);
    _sharedPrefs.setString(keyUser, encoded);
  }

}

final sharedPrefs = SharedPrefs();
const String is_dark = "is_dark";
const String is_logged_in = "is_logged_in";
const String keyUser = "key_user";
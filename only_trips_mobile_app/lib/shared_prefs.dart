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

  String get name => _sharedPrefs.getString(keyName) ?? "";
  set name(String value) {
    _sharedPrefs.setString(keyName, value);
  }

  String get email => _sharedPrefs.getString(keyEmail) ?? "";
  set email(String value) {
    _sharedPrefs.setString(keyEmail, value);
  }

  int get age => _sharedPrefs.getInt(keyAge) ?? "";
  set age(int value) {
    _sharedPrefs.setInt(keyAge, value);
  }

  String get city => _sharedPrefs.getString(keyCity) ?? "";
  set city(String value) {
    _sharedPrefs.setString(keyCity, value);
  }

  String get state => _sharedPrefs.getString(keyState) ?? "";
  set state(String value) {
    _sharedPrefs.setString(keyState, value);
  }

  String get country => _sharedPrefs.getString(keyCountry) ?? "";
  set country(String value) {
    _sharedPrefs.setString(keyCountry, value);
  }

  String get zip => _sharedPrefs.getString(keyZip) ?? "";
  set zip(String value) {
    _sharedPrefs.setString(keyZip, value);
  }

  String get userId => _sharedPrefs.getString(key_uuid) ?? "";
  set userId(String value) {
    _sharedPrefs.setString(key_uuid, value);
  }

  String get confirmed => _sharedPrefs.getBool(keyConfirmed) ?? "";

}

final sharedPrefs = SharedPrefs();
const String keyName = "key_name";
const String keyEmail = "key_email";
const String keyAge = "key_age";
const String keyCity = "key_city";
const String keyState = "key_state";
const String keyCountry = "key_country";
const String keyZip = "key_zip";
const String key_uuid = "key_uuid";
const String is_dark = "is_dark";
const String is_logged_in = "is_logged_in";
const String keyConfirmed = "key_confirmed";
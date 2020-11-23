import 'package:flutter/material.dart';
import 'package:onlytrips/shared_prefs.dart';
import 'package:day_night_switch/day_night_switch.dart';
import 'package:onlytrips/themes.dart';
import 'package:provider/provider.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    final themeNotifier = Provider.of<ThemeNotifier>(context);
    return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Text("Settings"),
          ),
          body: ListView(
            children: <Widget>[
              ListTile(
                title: Text('Dark Theme'),
                contentPadding: const EdgeInsets.only(left: 16.0),
                trailing: Transform.scale(
                  scale: 0.4,
                  child: DayNightSwitch(
                    value: sharedPrefs.isDarkMode,
                    onChanged: (val) {
                      setState(() {
                        sharedPrefs.isDarkMode = val;
                      });
                      onThemeChanged(val, themeNotifier);
                    },
                  ),
                ),
              )
            ],
          ),
        )
    );
  }

  void onThemeChanged(bool value, ThemeNotifier themeNotifier) async {
    (value)
        ? themeNotifier.setTheme(darkTheme)
        : themeNotifier.setTheme(lightTheme);
    sharedPrefs.isDarkMode = value;
  }
}

import 'package:flutter/material.dart';
import 'package:onlytrips/login.dart';
import 'package:onlytrips/settingspage.dart';
import 'package:onlytrips/profile.dart';
import 'package:onlytrips/shared_prefs.dart';
import 'package:onlytrips/start.dart';
import 'package:onlytrips/themes.dart';
import 'package:onlytrips/user.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NavDrawer extends StatelessWidget {
  final User testUser = User(
    name: "Sebastian",
    age: 20,
    email: "sebastiansalazar0330@gmail.com",
    password: "cookie",
    city: "Orlando",
    state: "FL",
    country: "United States",
    zipCode: 32832,
  );

  @override
  Widget build(BuildContext context) {
    final themeNotifier = Provider.of<ThemeNotifier>(context);
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
                color: Colors.white,
                image: DecorationImage(
                    fit: BoxFit.fitWidth,
                    image: AssetImage('assets/logo.png'))),
            child: null,
          ),
          // TODO - Add other tiles leading to other pages
          ListTile(
            leading: Icon(Icons.input),
            title: Text('Home'),
            onTap: () => {Navigator.of(context).pop()},
          ),
          ListTile(
            leading: Icon(Icons.verified_user),
            title: Text('Profile'),
            onTap: () => {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (_) => ProfilePage(currUser: testUser)))
            },
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Settings'),
            onTap: () => {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => SettingsPage()))
            },
          ),
          ListTile(
              leading: Icon(Icons.exit_to_app),
              title: Text('Logout'),
              onTap: () async {
                sharedPrefs.clear(themeNotifier);
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => StartPage()));
              }),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:onlytrips/settingspage.dart';
import 'package:onlytrips/profile.dart';
import 'package:onlytrips/shared_prefs.dart';
import 'package:onlytrips/start.dart';
import 'package:onlytrips/themes.dart';
import 'package:provider/provider.dart';
import 'login_classes.dart';

class NavDrawer extends StatelessWidget {
  final User currUser = sharedPrefs.currUser;

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
                      builder: (_) => ProfilePage(currUser: currUser)))
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

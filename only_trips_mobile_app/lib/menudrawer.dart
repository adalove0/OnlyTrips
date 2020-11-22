import 'package:flutter/material.dart';
import 'package:onlytrips/settingspage.dart';
import 'package:onlytrips/profile.dart';
import 'package:onlytrips/user.dart';

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
            onTap: () => {
              // TODO - Create logout function/delete session
              Navigator.of(context).pushReplacementNamed('/start')
            },
          ),
        ],
      ),
    );
  }
}

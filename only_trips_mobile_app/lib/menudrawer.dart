import 'package:flutter/material.dart';

class NavDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
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
            // TODO - Create profile page
            onTap: () => {Navigator.of(context).pop()},
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Settings'),
            // TODO - Create settings page
            onTap: () => {Navigator.of(context).pop()},
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
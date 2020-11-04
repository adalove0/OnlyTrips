import 'package:flutter/material.dart';

import 'home.dart';
import 'home.dart';
import 'login.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          children: <Widget>[
            SizedBox(height: 80.0),
            Column(
              children: <Widget>[
                Image.asset('assets/transparent_logo.png'),
              ],
            ),
            SizedBox(height: 120.0),
            // TODO: Wrap Username with AccentColorOverride (103)
            // TODO: Remove filled: true values (103)
            // TODO: Wrap Password with AccentColorOverride (103)
            // TODO: Add TextField widgets (101)
            // [Name]
            TextField(
              decoration: InputDecoration(
                filled: true,
                labelText: 'Username',
              ),
            ),
            // spacer
            SizedBox(height: 12.0),
            TextField(
              decoration: InputDecoration(
                filled: true,
                labelText: 'Password',
              ),
              obscureText: true,
            ),
            // TODO: Add button bar (101)
            ButtonBar(
              children: <Widget>[
                // TODO: Add buttons (101)
                FlatButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => HomePage())
                    );
                  },
                  child: Text('REGISTER'),
                ),
                // TODO: Add an elevation to NEXT (103)
                // TODO: Add a beveled rectangular border to NEXT (103)
                RaisedButton(
                  child: Text('CANCEL'),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
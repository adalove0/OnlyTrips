import 'package:flutter/material.dart';
import 'package:onlytrips/register.dart';
import 'package:onlytrips/login.dart';

import 'register.dart';

class StartPage extends StatefulWidget {
  @override
  _StartPageState createState() => _StartPageState();
}
class _StartPageState extends State<StartPage> {
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
            RaisedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => RegisterPage())
                  );
                },
                child: Container(
                  decoration: const BoxDecoration(
                    // TODO: Add decoration
                  ),
                  padding: const EdgeInsets.all(10.0),
                  child: const Text('Register'),
                ),
                ),
              ],
            ),
        ),
      );
  }
}
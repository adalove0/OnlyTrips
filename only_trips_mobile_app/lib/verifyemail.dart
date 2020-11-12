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
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: <Widget>[
            SizedBox(height: 100.0),
            Column(
              children: <Widget>[
                Center(
                    child: Image.asset('assets/logo.png')
                ),
              ],
            ),
            SizedBox(height: 120.0),
          ],
        ),
      ),
    );
  }
}
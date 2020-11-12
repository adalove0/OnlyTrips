import 'package:flutter/material.dart';
import 'package:onlytrips/verifyemail.dart';
import 'dart:convert'; // Used for json conversion
import 'home.dart';
import 'package:crypto/crypto.dart'; // Use for password hashing
// ignore: avoid_web_libraries_in_flutter
import 'dart:html'; // Use to post to the api server

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  var email = "";
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ListView(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          children: <Widget>[
            SizedBox(height: 80.0),
            Column(
              children: <Widget>[
                Image.asset('assets/logo.png'),
              ],
            ),
            SizedBox(height: 120.0),
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
                labelText: 'Email',
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
            ButtonBar(
              children: <Widget>[
                FlatButton(
                  child: Text('Cancel'),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                RaisedButton(
                  onPressed: () {
                    Navigator.push(
                      // TODO: Create actual register function
                        context,
                        MaterialPageRoute(builder: (context) => VerifyPage())
                    );
                  },
                  child: Text('Submit'),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
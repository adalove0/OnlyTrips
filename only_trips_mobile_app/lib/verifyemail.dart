import 'package:flutter/material.dart';
import 'package:onlytrips/register.dart';
import 'package:onlytrips/login.dart';

import 'register.dart';

class VerifyPage extends StatefulWidget {
  @override
  _VerifyPageState createState() => _VerifyPageState();
}
class _VerifyPageState extends State<VerifyPage> {
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
            Text(
              'A verification link has been sent to your email. Please click on it before attempting to log in.',
              maxLines: 3,
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
            ),
            ButtonBar(
              children: <Widget>[
                FlatButton(
                  child: Text('Resend'),
                  onPressed: () {
                    // TODO: Connect to email send API
                  },
                ),
                RaisedButton(
                  child: Text('Go to login'),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => LoginPage())
                    );
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
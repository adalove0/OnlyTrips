import 'package:flutter/material.dart';
import 'package:onlytrips/register.dart';
import 'package:onlytrips/login.dart';

class StartPage extends StatefulWidget {
  @override
  _StartPageState createState() => _StartPageState();
}
class _StartPageState extends State<StartPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
            child: Column(
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
                RaisedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => LoginPage())
                    );
                  },
                  child: Container(
                    decoration: const BoxDecoration(
                      // TODO: Add decoration
                    ),
                    padding: const EdgeInsets.all(10.0),
                    child: const Text('Login'),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
  }
}
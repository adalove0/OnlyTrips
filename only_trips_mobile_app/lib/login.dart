import 'package:flutter/material.dart';
import 'package:onlytrips/home.dart';
import 'dart:convert'; // Used for json serialization
import 'package:crypto/crypto.dart'; // Use for password hashing
// ignore: avoid_web_libraries_in_flutter
import 'package:http/http.dart' as http; // Use to post to the api server
import 'package:email_validator/email_validator.dart';
import 'package:onlytrips/shared_prefs.dart';
import 'package:onlytrips/login_classes.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String _email, _password = "";
  Future<Login> _response;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  FocusNode _emailFocusNode = FocusNode();
  FocusNode _passwordFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.lightBlueAccent[400],
          centerTitle: true,
          title: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Only',
                style: TextStyle(
                  fontFamily: 'Gotham Light Regular',
                  fontSize: 25.0,
                ),
              ),
              Text(
                'Trips',
                style: TextStyle(
                  fontFamily: 'Marguerite',
                ),
              ),
              Container(
                width: 50.0,
              ),
              Text(
                'Login',
                style: TextStyle(
                  fontFamily: 'Heebo',
                ),
              ),
            ],
          ),
        ),
        body: loginPageBody(),
      ),
    );
  }

  void fieldFocusChange(
      BuildContext context, FocusNode currentFocus, FocusNode nextFocus) {
    currentFocus.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }

  Widget loginPageBody() {
    return SingleChildScrollView(
      child: Container(
          padding: const EdgeInsets.all(16),
          child: (_response == null)
              ? Form(
                  key: _formKey,
                  child: Column(
                    children: <Widget>[
                      Column(
                        children: <Widget>[
                          Image.asset('assets/logo.png'),
                        ],
                      ),
                      emailInput(),
                      SizedBox(
                        height: 16,
                      ),
                      passwordInput(),
                      SizedBox(
                        height: 16,
                      ),
                      submitButton(),
                    ],
                  ),
                )
              : FutureBuilder<Login>(
                  future: _response,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      // TODO: If user isn't verified, handle appropriately
                      if (snapshot.data.success) {
                        // TODO: Change true to snapshot.data.success prior to deployment to handle errors in the credentials
                        sharedPrefs.currUser = snapshot.data.user;
                        return Column(
                          children: <Widget>[
                            Text(snapshot.data.message),
                            RaisedButton(
                              child: Text('Go to homepage'),
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => HomePage()));
                              },
                            ),
                          ],
                        );
                      } else {
                        return Column(
                          children: <Widget>[
                            Image.asset('assets/logo.png'),
                            SizedBox(
                              height: 16,
                            ),
                            Text(snapshot.data.message),
                            RaisedButton(
                              child: Text('Go back'),
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => LoginPage()));
                              },
                            ),
                          ],
                        );
                      }
                    } else if (snapshot.hasError) {
                      return Column(
                        children: <Widget>[
                          Image.asset('assets/logo.png'),
                          SizedBox(
                            height: 16,
                          ),
                          Text(snapshot.error.toString()),
                          RaisedButton(
                            child: Text('Go back'),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          ),
                        ],
                      );
                    }
                    return CircularProgressIndicator();
                  },
                )),
    );
  }

  Widget emailInput() {
    return TextFormField(
      focusNode: _emailFocusNode,
      autofocus: true,
      onFieldSubmitted: (_) {
        fieldFocusChange(context, _emailFocusNode, _passwordFocusNode);
      },
      validator: (email) =>
          EmailValidator.validate(email) ? null : "Invalid email address",
      onSaved: (email) => _email = email,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        labelText: "Email",
        hintText: "e.g onlytrips@gmail.com",
      ),
      textInputAction: TextInputAction.next,
    );
  }

  Widget passwordInput() {
    return TextFormField(
      focusNode: _passwordFocusNode,
      validator: (password) {
        Pattern pattern = '^.{6,}\$';
        RegExp regex = new RegExp(pattern);
        if (!regex.hasMatch(password))
          return 'Password must be greater than 6 characters.';
        else
          return null;
      },
      onSaved: (password) => _password = password,
      keyboardType: TextInputType.text,
      obscureText: true,
      decoration: InputDecoration(
        labelText: "Password",
        suffixIcon: Icon(Icons.lock),
      ),
      textInputAction: TextInputAction.done,
    );
  }

  RaisedButton submitButton() {
    return RaisedButton(
      color: Theme.of(context).primaryColor,
      onPressed: () {
        if (_formKey.currentState.validate()) {
          _formKey.currentState.save();
          Future.delayed(const Duration(milliseconds: 100), () async {
            setState(() {
              _response = submitLogin(_email, _password);
            });
          });
        }
      },
      child: Text(
        "Submit",
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}

Future<Login> submitLogin(String _email, String _password) async {
  final http.Response response =
      await http.post('https://onlytrips.herokuapp.com/login',
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: jsonEncode({
            'email': _email,
            'password': _password,
          }));
  if (response.statusCode == 200) {
    return Login.fromJson(jsonDecode(response.body));
  } else if (response.statusCode == 400) {
    throw Exception('Unable to log in, check username and password and try again');
  } else if (response.statusCode == 401) {
    throw Exception('No account registered with that email');
  } else if (response.statusCode == 402) {
    throw Exception('Please verify your email and try again');
  } else if (response.statusCode == 403) {
    throw Exception('Incorrect email and/or password');
  } else {
    throw Exception('Failed to login');
  }
}

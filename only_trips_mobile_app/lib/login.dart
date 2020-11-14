import 'package:flutter/material.dart';
import 'package:onlytrips/home.dart';
import 'dart:convert'; // Used for json serialization
import 'package:crypto/crypto.dart'; // Use for password hashing
// ignore: avoid_web_libraries_in_flutter
import 'package:http/http.dart' as http; // Use to post to the api server
import 'package:email_validator/email_validator.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String _email, _password = "";
  // TODO: Hash password

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  FocusNode _emailFocusNode = FocusNode();
  FocusNode _passwordFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
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
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              SizedBox(height: 80.0),
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
        ),
      ),
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
          // TODO: Connect to API
          // TODO: Hash user input password
          // TODO: Generate JSON
          // TODO: Send json to API
          // TODO: If user isn't verified, handle appropriately
          // TODO: Handle invalid credentials
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => HomePage()));
        }
      },
      child: Text(
        "Submit",
        style: TextStyle(color: Colors.white),
      ),
    );
  }

  Future<http.Response> submitLogin() {
    return http.post(
      'https://heroku.com/api', // TODO: Add URL on hosted API
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'email': _email,
        'password': _password,
      }),
    );
  }
}

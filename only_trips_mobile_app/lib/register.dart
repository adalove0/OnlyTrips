// ignore: avoid_web_libraries_in_flutter
// import 'dart:js'; //
import 'package:flutter/material.dart';
import 'dart:convert'; // Used for json conversion
import 'package:crypto/crypto.dart'; // Use for password hashing
// ignore: avoid_web_libraries_in_flutter
import 'package:http/http.dart' as http; // Use to post to the api server
import 'package:email_validator/email_validator.dart';
import 'package:onlytrips/verifyemail.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  String _name, _email, _password, _city, _state, _country, _zip, _age = "";
  // TODO: Hash password

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  FocusNode _nameFocusNode = FocusNode();
  FocusNode _emailFocusNode = FocusNode();
  FocusNode _passwordFocusNode = FocusNode();
  FocusNode _ageFocusNode = FocusNode();
  FocusNode _cityFocusNode = FocusNode();
  FocusNode _stateFocusNode = FocusNode();
  FocusNode _countryFocusNode = FocusNode();
  FocusNode _zipFocusNode = FocusNode();

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
                'Registration',
                style: TextStyle(
                  fontFamily: 'Heebo',
                ),
              ),
            ],
          ),
        ),
        body: registerPageBody(),
      ),
    );
  }

  void fieldFocusChange(
      BuildContext context, FocusNode currentFocus, FocusNode nextFocus) {
    currentFocus.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }

  Widget registerPageBody() {
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
              SizedBox(
                height: 16,
              ),
              emailInput(),
              SizedBox(
                height: 16,
              ),
              nameInput(),
              SizedBox(
                height: 16,
              ),
              passwordInput(),
              SizedBox(
                height: 16,
              ),
              ageInput(),
              SizedBox(
                height: 16,
              ),
              cityInput(),
              SizedBox(
                height: 16,
              ),
              stateInput(),
              SizedBox(
                height: 16,
              ),
              countryInput(),
              SizedBox(
                height: 16,
              ),
              zipInput(),
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
        fieldFocusChange(context, _emailFocusNode, _nameFocusNode);
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

  Widget nameInput() {
    return TextFormField(
      focusNode: _nameFocusNode,
      textInputAction: TextInputAction.next,
      validator: (name) {
        Pattern pattern = '^[a-zA-Z]+(?:(?:[\',. -][a-zA-Z ])?[a-zA-Z]*)*\$';
        RegExp regex = new RegExp(pattern);
        if (!regex.hasMatch(name))
          return 'Please input alphabetic name';
        else
          return null;
      },
      onSaved: (name) => _name = name,
      textCapitalization: TextCapitalization.words,
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        labelText: "Name",
        hintText: "e.g Ford Prefect",
      ),
      onFieldSubmitted: (_) {
        fieldFocusChange(context, _nameFocusNode, _passwordFocusNode);
      },
    );
  }

  Widget passwordInput() {
    return TextFormField(
      focusNode: _passwordFocusNode,
      validator: (password) {
        Pattern pattern = '^.{6,}\$';
        RegExp regex = new RegExp(pattern);
        if (!regex.hasMatch(password))
          return 'Please input a password 6 characters or greater.';
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
      textInputAction: TextInputAction.next,
      onFieldSubmitted: (_) {
        fieldFocusChange(context, _passwordFocusNode, _ageFocusNode);
      },
    );
  }

  Widget ageInput() {
    return TextFormField(
      focusNode: _ageFocusNode,
      onFieldSubmitted: (_) {
        fieldFocusChange(context, _ageFocusNode, _cityFocusNode);
      },
      validator: (age) {
        Pattern pattern = '^[0-9][0-9]?\$';
        RegExp regex = new RegExp(pattern);
        if (!regex.hasMatch(age))
          return 'Age must be between 0-99.';
        else
          return null;
      },
      onSaved: (age) => _age = age,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        labelText: "Age",
        hintText: "e.g 18",
      ),
      textInputAction: TextInputAction.next,
    );
  }

  Widget cityInput() {
    return TextFormField(
      focusNode: _cityFocusNode,
      onFieldSubmitted: (_) {
        fieldFocusChange(context, _cityFocusNode, _stateFocusNode);
      },
      validator: (city) {
        Pattern pattern = '^[a-zA-Z]+(?:(?:[\',. -][a-zA-Z ])?[a-zA-Z]*)*\$';
        RegExp regex = new RegExp(pattern);
        if (!regex.hasMatch(city))
          return 'Please input city name with alphabetic characters only.';
        else
          return null;
      },
      textCapitalization: TextCapitalization.words,
      onSaved: (city) => _city = city,
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        labelText: "City",
        hintText: "e.g Orlando",
      ),
      textInputAction: TextInputAction.next,
    );
  }

  Widget stateInput() {
    return TextFormField(
      focusNode: _stateFocusNode,
      onFieldSubmitted: (_) {
        fieldFocusChange(context, _stateFocusNode, _countryFocusNode);
      },
      validator: (state) {
        Pattern pattern = '^[A-Za-z][A-Za-z]\$';
        RegExp regex = new RegExp(pattern);
        if (!regex.hasMatch(state))
          return 'Input 2 character state abbreviation.';
        else
          return null;
      },
      onSaved: (state) => _state = state,
      keyboardType: TextInputType.text,
      textCapitalization: TextCapitalization.characters,
      decoration: InputDecoration(
        labelText: "State",
        hintText: "e.g FL",
      ),
      textInputAction: TextInputAction.next,
    );
  }

  Widget countryInput() {
    return TextFormField(
      focusNode: _countryFocusNode,
      onFieldSubmitted: (_) {
        fieldFocusChange(context, _countryFocusNode, _zipFocusNode);
      },
      validator: (country) {
        Pattern pattern = '^[a-zA-Z]+(?:(?:[\',. -][a-zA-Z ])?[a-zA-Z]*)*\$';
        RegExp regex = new RegExp(pattern);
        if (!regex.hasMatch(country))
          return 'Country names only accept alphabetic input.';
        else
          return null;
      },
      onSaved: (country) => _country = country,
      keyboardType: TextInputType.text,
      textCapitalization: TextCapitalization.words,
      decoration: InputDecoration(
        labelText: "Country",
        hintText: "e.g United States",
      ),
      textInputAction: TextInputAction.next,
    );
  }

  Widget zipInput() {
    return TextFormField(
      focusNode: _zipFocusNode,
      validator: (zip) {
        Pattern pattern = '^[0-9]{5}\$';
        RegExp regex = new RegExp(pattern);
        if (!regex.hasMatch(zip))
          return 'Please input a 5 digit zip code.';
        else
          return null;
      },
      onSaved: (zip) => _zip = zip,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        labelText: "Zip Code",
        hintText: "e.g 50210",
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
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => VerifyPage()));
        }
      },
      child: Text(
        "Submit",
        style: TextStyle(color: Colors.white),
      ),
    );
  }

  Future<http.Response> submitRegistration() {
    return http.post(
      'https://heroku.com/api', // TODO: Add URL on hosted API
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'email': _email,
        'name': _name,
        'password': _password,
        'age': _age,
        'city': _city,
        'state': _state,
        'country': _country,
        'zip': _zip
      }),
    );
  }
}

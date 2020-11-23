import 'dart:convert';
import 'package:http/http.dart' as http; // Use to post to the api server
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:onlytrips/login_classes.dart';
import 'package:onlytrips/shared_prefs.dart';
import 'package:shared_preferences/shared_preferences.dart';

class EditProfile extends StatelessWidget {
  final User currUser;

  EditProfile({this.currUser});

  @override
  Widget build(BuildContext context) {
    final appTitle = 'Edit Profile';

    return MaterialApp(
      title: appTitle,
      home: Scaffold(
        appBar: AppBar(
          title: Text(appTitle),
        ),
        body: CustomForm(currUser: currUser),
      ),
    );
  }
}

// Create a Form widget.
class CustomForm extends StatefulWidget {
  final User currUser;

  CustomForm({this.currUser});

  @override
  CustomFormState createState() {
    return CustomFormState(currUser: currUser);
  }
}

// Create a corresponding State class.
// This class holds data related to the form.
class CustomFormState extends State<CustomForm> {
  User currUser;

  CustomFormState({this.currUser});
  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  //
  // Note: This is a GlobalKey<FormState>,
  // not a GlobalKey<MyCustomFormState>.
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TextFormField(
            decoration: InputDecoration(
              labelText: "Name",
            ),
            validator: (value) {
              if (value.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
            initialValue: currUser.name,
          ),
          TextFormField(
            decoration: InputDecoration(
              labelText: "Email",
            ),
            validator: (value) {
              if (value.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
            initialValue: currUser.email,
            keyboardType: TextInputType.emailAddress,
          ),
          TextFormField(
            decoration: InputDecoration(
              labelText: "Age",
            ),
            validator: (value) {
              if (value.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
            initialValue: currUser.age.toString(),
          ),
          TextFormField(
            decoration: InputDecoration(
              labelText: "City",
            ),
            validator: (value) {
              if (value.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
            initialValue: currUser.location[0].city,
          ),
          TextFormField(
            decoration: InputDecoration(
              labelText: "State",
            ),
            validator: (value) {
              if (value.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
            initialValue: currUser.location[0].state,
          ),
          TextFormField(
              decoration: InputDecoration(
                labelText: "Country",
              ),
              validator: (value) {
                if (value.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
              initialValue: currUser.location[0].country),
          TextFormField(
            decoration: InputDecoration(
              labelText: "Zip Code",
            ),
            validator: (value) {
              if (value.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
            initialValue: currUser.location[0].zip.toString(),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: ElevatedButton(
              onPressed: () {
                // Validate returns true if the form is valid, or false
                // otherwise.
                if (_formKey.currentState.validate()) {
                  // If the form is valid, display a Snackbar.
                  Scaffold.of(context)
                      .showSnackBar(SnackBar(content: Text('Processing Data')));
                }
              },
              child: Text('Submit'),
            ),
          ),
        ],
      ),
    );
  }
}

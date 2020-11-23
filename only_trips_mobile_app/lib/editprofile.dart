import 'dart:convert';
import 'package:http/http.dart' as http; // Use to post to the api server
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:onlytrips/login_classes.dart';
import 'package:onlytrips/profile.dart';
import 'package:onlytrips/home.dart';

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
          title: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Edit',
                style: TextStyle(
                  fontFamily: 'Gotham Light Regular',
                  fontSize: 25.0,
                ),
              ),
              Text(
                'Profile',
                style: TextStyle(
                  fontFamily: 'Marguerite',
                ),
              ),
            ],
          ),
          leading: FlatButton(
              onPressed: () => Navigator.push(
                  context, MaterialPageRoute(builder: (_) => HomePage())),
              child: Icon(Icons.arrow_back)),
          backgroundColor: Colors.lightBlueAccent[400],
          centerTitle: true,
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
  bool _secureText = true;

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
      child: ListView(
        physics: const AlwaysScrollableScrollPhysics(),
        children: <Widget>[
          Card(
            margin: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 0),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)),
            color: Colors.blue[100],
            child: Padding(
              padding: const EdgeInsets.only(left: 8.0, right: 8.0),
              child: TextFormField(
                decoration: InputDecoration(
                    labelText: "Name", border: InputBorder.none),
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
                initialValue: currUser.name,
              ),
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          Card(
            margin: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 0),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)),
            color: Colors.blue[100],
            child: Padding(
              padding: const EdgeInsets.only(left: 8.0, right: 8.0),
              child: TextFormField(
                decoration: InputDecoration(
                  labelText: "Email",
                  border: InputBorder.none,
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
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          Card(
            margin: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 0),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)),
            color: Colors.blue[100],
            child: Padding(
              padding: const EdgeInsets.only(left: 8.0, right: 8.0),
              child: TextFormField(
                decoration: InputDecoration(
                    labelText: "Password",
                    border: InputBorder.none,
                    suffixIcon: IconButton(
                      icon: Icon(
                          _secureText ? Icons.remove_red_eye : Icons.security),
                      onPressed: () {
                        setState(() {
                          _secureText = !_secureText;
                        });
                      },
                    )),
                obscureText: _secureText,
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
                initialValue: currUser.name,
              ),
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          Card(
            margin: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 0),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)),
            color: Colors.blue[100],
            child: Padding(
              padding: const EdgeInsets.only(left: 8.0, right: 8.0),
              child: TextFormField(
                decoration:
                    InputDecoration(labelText: "Age", border: InputBorder.none),
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
                initialValue: currUser.age.toString(),
                keyboardType: TextInputType.number,
              ),
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          Card(
            margin: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 0),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)),
            color: Colors.blue[100],
            child: Padding(
              padding: const EdgeInsets.only(left: 8.0, right: 8.0),
              child: TextFormField(
                decoration: InputDecoration(
                    labelText: "City", border: InputBorder.none),
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
                initialValue: currUser.location[0].city,
              ),
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          Card(
            margin: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 0),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)),
            color: Colors.blue[100],
            child: Padding(
              padding: const EdgeInsets.only(left: 8.0, right: 8.0),
              child: TextFormField(
                decoration: InputDecoration(
                    labelText: "State", border: InputBorder.none),
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
                initialValue: currUser.location[0].state,
              ),
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          Card(
            margin: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 0),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)),
            color: Colors.blue[100],
            child: Padding(
              padding: const EdgeInsets.only(left: 8.0, right: 8.0),
              child: TextFormField(
                  decoration: InputDecoration(
                      labelText: "Country", border: InputBorder.none),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                  initialValue: currUser.location[0].country),
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          Card(
            margin: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 0),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)),
            color: Colors.blue[100],
            child: Padding(
              padding: const EdgeInsets.only(left: 8.0, right: 8.0),
              child: TextFormField(
                decoration: InputDecoration(
                    labelText: "Zip Code", border: InputBorder.none),
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
                initialValue: currUser.location[0].zip.toString(),
                keyboardType: TextInputType.number,
              ),
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          GestureDetector(
            onTap: () => {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (_) => ProfilePage(currUser: widget.currUser))),
            },
            child: Card(
              margin: EdgeInsets.all(10.0),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0)),
              color: Colors.green,
              child: ListTile(
                leading: Icon(
                  Icons.done_outline,
                  size: 35.0,
                ),
                title: Text(
                  "CONFIRM",
                  style: TextStyle(
                    fontSize: 20.0,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

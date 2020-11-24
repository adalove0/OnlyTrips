import 'dart:convert';
import 'package:http/http.dart' as http; // Use to post to the api server
import 'package:flutter/material.dart';
import 'package:onlytrips/edit_budget.dart';
import 'package:onlytrips/home.dart';
import 'package:onlytrips/shared_prefs.dart';
import 'package:onlytrips/trip.dart';

class TripView extends StatefulWidget {
  final Trip currTrip;

  TripView({this.currTrip});

  @override
  _TripViewState createState() => _TripViewState();
}

class _TripViewState extends State<TripView> {
  Future<Delete> _response;

  void _onAfterBuild(BuildContext context) {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => HomePage()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Trip',
              style: TextStyle(
                fontFamily: 'Gotham Light Regular',
                fontSize: 25.0,
              ),
            ),
            Container(
              width: 10.0,
            ),
            Text(
              'Details',
              style: TextStyle(
                fontFamily: 'Marguerite',
                fontSize: 20.0,
                color: Colors.lightBlueAccent[400],
              ),
            ),
          ],
        ),
      ),
      body: (_response == null)
          ? SingleChildScrollView(
              child: Column(children: <Widget>[
              Card(
                margin: EdgeInsets.all(10.0),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0)),
                child: ListTile(
                  leading: Icon(
                    Icons.date_range,
                    size: 35.0,
                  ),
                  title: Text(
                    "Travel Dates",
                    style: TextStyle(
                      fontFamily: 'Gotham Light Regular',
                      fontSize: 20.0,
                    ),
                  ),
                  subtitle: Row(
                    children: [
                      Text(
                        "${widget.currTrip.startDate.substring(0, 10)}",
                        style: TextStyle(
                          fontFamily: 'Gotham Light Regular',
                          fontSize: 20.0,
                        ),
                      ),
                      Icon(
                        Icons.arrow_right_alt,
                        color: Colors.grey[600],
                      ),
                      Text(
                        "${widget.currTrip.endDate.substring(0, 10)}",
                        style: TextStyle(
                          fontFamily: 'Gotham Light Regular',
                          fontSize: 20.0,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Card(
                margin: EdgeInsets.all(10.0),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0)),
                child: ListTile(
                  leading: Icon(
                    Icons.location_on,
                    size: 35.0,
                  ),
                  title: Text(
                    "Destination:",
                    style: TextStyle(
                      fontFamily: 'Gotham Light Regular',
                      fontSize: 20.0,
                    ),
                  ),
                  subtitle: Text(
                    "${widget.currTrip.destination.elementAt(0).city}, ${widget.currTrip.destination.elementAt(0).state}",
                    style: TextStyle(
                      fontFamily: 'Gotham Light Regular',
                      fontSize: 20.0,
                    ),
                  ),
                ),
              ),
              Card(
                margin: EdgeInsets.all(10.0),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0)),
                child: ListTile(
                  leading: Icon(
                    Icons.accessibility_new,
                    size: 35.0,
                  ),
                  title: Text(
                    "Number of People:",
                    style: TextStyle(
                      fontFamily: 'Gotham Light Regular',
                      fontSize: 20.0,
                    ),
                  ),
                  subtitle: Text(
                    "${widget.currTrip.numPeople.toString()}",
                    style: TextStyle(
                      fontFamily: 'Gotham Light Regular',
                      fontSize: 20.0,
                    ),
                  ),
                ),
              ),
              if (widget.currTrip.budget.isNotEmpty)
                budgetCards(), // Print budget if budget isn't empty
              GestureDetector(
                onTap: () => {
                  showAlertDialog(context),
                },
                child: Card(
                  margin: EdgeInsets.all(10.0),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0)),
                  color: Colors.redAccent,
                  child: ListTile(
                    leading: Icon(
                      Icons.delete_forever,
                      size: 35.0,
                    ),
                    title: Text(
                      "DELETE TRIP",
                      style: TextStyle(
                        fontFamily: 'Gotham Light Bold',
                        fontSize: 20.0,
                      ),
                    ),
                  ),
                ),
              ),
            ]))
          : FutureBuilder<Delete>(
              future: _response,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  if (snapshot.data.success) {
                    WidgetsBinding.instance
                        .addPostFrameCallback((_) => _onAfterBuild(context));
                  } else {
                    return Column(
                      children: <Widget>[
                        SizedBox(
                          height: 16,
                        ),
                        Text(snapshot.data.message),
                        RaisedButton(
                          child: Text('Go back'),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                      ],
                    );
                  }
                } else if (snapshot.hasError) {
                  return Column(
                    children: <Widget>[
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
            ),
    );
  }

  Widget budgetCards() {
    return Column(
      children: <Widget>[
        Container(
            child: Text(
          "Budgeting:",
          style: TextStyle(
            fontFamily: 'Gotham Light Regular',
            fontSize: 20.0,
          ),
        )),
        Column(children: <Widget>[
          Card(
            margin: EdgeInsets.all(10.0),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)),
            child: ListTile(
              leading: Icon(
                Icons.attach_money,
                size: 35.0,
              ),
              title: Text(
                "Travel:",
                style: TextStyle(
                  fontFamily: 'Gotham Light Regular',
                  fontSize: 20.0,
                ),
              ),
              trailing: Text(
                '\$' +
                    widget.currTrip.budget.elementAt(0).travelCost.toString(),
                style: TextStyle(
                  fontFamily: 'Gotham Light Regular',
                  fontSize: 20.0,
                ),
              ),
            ),
          ),
          Card(
            margin: EdgeInsets.all(10.0),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)),
            child: ListTile(
              leading: Icon(
                Icons.attach_money,
                size: 35.0,
              ),
              title: Text(
                "Food:",
                style: TextStyle(
                  fontFamily: 'Gotham Light Regular',
                  fontSize: 20.0,
                ),
              ),
              trailing: Text(
                '\$' + widget.currTrip.budget.elementAt(0).foodCost.toString(),
                style: TextStyle(
                  fontFamily: 'Gotham Light Regular',
                  fontSize: 20.0,
                ),
              ),
            ),
          ),
          Card(
            margin: EdgeInsets.all(10.0),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)),
            child: ListTile(
              leading: Icon(
                Icons.attach_money,
                size: 35.0,
              ),
              title: Text(
                "Lodging:",
                style: TextStyle(
                  fontFamily: 'Gotham Light Regular',
                  fontSize: 20.0,
                ),
              ),
              trailing: Text(
                '\$' +
                    widget.currTrip.budget.elementAt(0).lodgingCost.toString(),
                style: TextStyle(
                  fontFamily: 'Gotham Light Regular',
                  fontSize: 20.0,
                ),
              ),
            ),
          ),
          Card(
            margin: EdgeInsets.all(10.0),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)),
            child: ListTile(
              leading: Icon(
                Icons.attach_money,
                size: 35.0,
              ),
              title: Text(
                "Misc:",
                style: TextStyle(
                  fontFamily: 'Gotham Light Regular',
                  fontSize: 20.0,
                ),
              ),
              trailing: Text(
                '\$' +
                    widget.currTrip.budget
                        .elementAt(0)
                        .miscellaneousCost
                        .toString(),
                style: TextStyle(
                  fontFamily: 'Gotham Light Regular',
                  fontSize: 20.0,
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () => {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          BudgetEdit(currTrip: widget.currTrip)))
            },
            child: Card(
              margin: EdgeInsets.all(10.0),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0)),
              color: Colors.green,
              child: ListTile(
                leading: Icon(
                  Icons.edit,
                  size: 35.0,
                ),
                title: Text(
                  "Edit Budget",
                  style: TextStyle(
                    fontFamily: 'Gotham Light Bold',
                    fontSize: 20.0,
                  ),
                ),
              ),
            ),
          ),
        ])
      ],
    );
  }

  showAlertDialog(BuildContext context) {
    // set up the buttons
    Widget cancelButton = FlatButton(
      child: Text("Cancel"),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );
    Widget continueButton = RaisedButton(
      child: Text("Delete"),
      onPressed: () {
        Navigator.of(context).pop();
        Future.delayed(const Duration(milliseconds: 100), () async {
          setState(() {
            _response = deleteTrip(widget.currTrip.sId);
          });
        });
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Delete"),
      content: Text("Are you sure you want to delete this trip?"),
      actions: [
        cancelButton,
        continueButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}

Future<Delete> deleteTrip(String tripId) async {
  final http.Response response =
      await http.post('https://onlytrips.herokuapp.com/deleteTrip',
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: jsonEncode({
            'email': sharedPrefs.currUser.email,
            'id': tripId,
          }));
  if (response.statusCode == 200) {
    return Delete.fromJson(jsonDecode(response.body));
  } else {
    throw ('Delete failed. Something doesn\'t want you to do that.');
  }
}

class Delete {
  bool success;
  String message;

  Delete({
    this.success,
    this.message,
  });

  Delete.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['message'] = this.message;
    return data;
  }
}

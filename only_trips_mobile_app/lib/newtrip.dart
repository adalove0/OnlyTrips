import 'dart:convert';
import 'package:http/http.dart' as http; // Use to post to the api server
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:onlytrips/home.dart';
import 'package:onlytrips/shared_prefs.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NewTrip extends StatefulWidget {
  @override
  _NewTripState createState() => _NewTripState();
}

final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

class _NewTripState extends State<NewTrip> {
  String _state, _city = "";
  DateTimeRange dates =
      DateTimeRange(start: DateTime.now(), end: DateTime.now());
  bool initializedOnce = false;
  int _numPeople = 0;
  Future<PostNewTrip> _response;

  Text generateDate(bool initializedOnce, bool isStart) {
    if (!initializedOnce) {
      return Text(
        "YYYY-MM-DD",
        style: TextStyle(
            fontSize: 20, fontWeight: FontWeight.bold, color: Colors.grey[400]),
      );
    } else if (isStart) {
      return Text(
        "${dates.start}".split(' ')[0],
        style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
      );
    } else {
      return Text(
        "${dates.end}".split(' ')[0],
        style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
      );
    }
  }

  _dateRangeThing(BuildContext context) async {
    initializedOnce = true;
    final DateTimeRange picked = await showDateRangePicker(
      context: context,
      firstDate: DateTime.now(),
      lastDate: DateTime(2025),
      saveText: "CONFIRM",
      builder: (context, child) {
        return Theme(
          data: ThemeData(
              primaryColor:
                  Colors.lightBlue), // This will change to light theme.
          child: child,
        );
      },
    );

    if (picked != null && picked != dates)
      setState(() {
        dates = picked;
      });
  }

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
                    'New',
                    style: TextStyle(
                      fontFamily: 'Gotham Light Regular',
                      fontSize: 25.0,
                    ),
                  ),
                  Text(
                    'Trip',
                    style: TextStyle(
                      fontFamily: 'Marguerite',
                    ),
                  ),
                ],
              ),
            ),
            body: SingleChildScrollView(
                child: Container(
                    padding: const EdgeInsets.all(16),
                    child: (_response == null)
                        ? Form(
                            key: _formKey,
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                        width: 90.0,
                                        child: Text("Depart:",
                                            style: TextStyle(
                                                fontSize: 20.0,
                                                fontFamily:
                                                    'Gotham Light Regular'))),
                                    SizedBox(width: 10.0),
                                    Card(
                                      color: Colors.lightBlue[100],
                                      child: Padding(
                                          padding: const EdgeInsets.all(6.0),
                                          child: generateDate(
                                              initializedOnce, true)),
                                    ),
                                    SizedBox(
                                      width: 20.0,
                                    ),
                                    RaisedButton(
                                      onPressed: () => _dateRangeThing(context),
                                      // Refer step 3
                                      child: Text(
                                        'Select date',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      color: Colors.lightBlueAccent,
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                        width: 90.0,
                                        child: Text("Return:",
                                            style: TextStyle(
                                                fontSize: 20.0,
                                                fontFamily:
                                                    'Gotham Light Regular'))),
                                    SizedBox(width: 10.0),
                                    Card(
                                      color: Colors.lightBlue[100],
                                      child: Padding(
                                        padding: const EdgeInsets.all(6.0),
                                        child: generateDate(
                                            initializedOnce, false),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 20.0,
                                    ),
                                    RaisedButton(
                                      onPressed: () => _dateRangeThing(context),
                                      // Refer step 3
                                      child: Text(
                                        'Select Date',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      color: Colors.lightBlueAccent,
                                    ),
                                  ],
                                ),
                                Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      TextFormField(
                                        validator: (state) {
                                          Pattern pattern =
                                              '^[a-zA-Z]+(?:(?:[\',. -][a-zA-Z ])?[a-zA-Z]*)*\$';
                                          RegExp regex = new RegExp(pattern);
                                          if (!regex.hasMatch(state))
                                            return 'Please input state name with alphabetic characters only.';
                                          else
                                            return null;
                                        },
                                        textCapitalization:
                                            TextCapitalization.words,
                                        onSaved: (state) => _state = state,
                                        keyboardType: TextInputType.text,
                                        textInputAction: TextInputAction.next,
                                        decoration: InputDecoration(
                                            labelText: "State",
                                            hintText: "e.g. Arizona"),
                                      ),
                                      TextFormField(
                                        onSaved: (city) => _city = city,
                                        textCapitalization:
                                            TextCapitalization.words,
                                        validator: (city) {
                                          Pattern pattern =
                                              '^[a-zA-Z]+(?:(?:[\',. -][a-zA-Z ])?[a-zA-Z]*)*\$';
                                          RegExp regex = new RegExp(pattern);
                                          if (!regex.hasMatch(city))
                                            return 'Please input city name with alphabetic characters only.';
                                          else
                                            return null;
                                        },
                                        keyboardType: TextInputType.text,
                                        textInputAction: TextInputAction.next,
                                        decoration: InputDecoration(
                                          labelText: "City",
                                          hintText: "Bisbee",
                                        ),
                                      ),
                                      TextFormField(
                                        onSaved: (numPeople) =>
                                            _numPeople = int.parse(numPeople),
                                        keyboardType: TextInputType.number,
                                        textInputAction: TextInputAction.done,
                                        validator: (age) {
                                          Pattern pattern = '^[0-9][0-9]?\$';
                                          RegExp regex = new RegExp(pattern);
                                          if (!regex.hasMatch(age))
                                            return 'Number of people must be between 0-99.';
                                          else
                                            return null;
                                        },
                                        inputFormatters: <TextInputFormatter>[
                                          FilteringTextInputFormatter.digitsOnly
                                        ],
                                        decoration: InputDecoration(
                                          labelText: "Number of Travelers",
                                          hintText: "e.g. 3",
                                        ),
                                      ),
                                      RaisedButton(
                                        child: Text(
                                          "Submit",
                                          style: TextStyle(color: Colors.white),
                                        ),
                                        color: Theme.of(context).accentColor,
                                        onPressed: () {
                                          if (_formKey.currentState
                                              .validate()) {
                                            _formKey.currentState.save();
                                            Future.delayed(
                                                const Duration(
                                                    milliseconds: 100),
                                                () async {
                                              await sharedPrefs.init();
                                              setState(() {
                                                _response = submitTrip(
                                                    sharedPrefs.currUser.email,
                                                    _numPeople,
                                                    _state,
                                                    _city,
                                                    dates.start
                                                        .toIso8601String(),
                                                    dates.end.toIso8601String(),
                                                    sharedPrefs
                                                        .currUser.userId);
                                              });
                                            });
                                          }
                                        },
                                      ),
                                    ]),
                              ],
                            ))
                        : FutureBuilder(
                            future: _response,
                            builder: (context, snapshot) {
                              if (snapshot.connectionState ==
                                  ConnectionState.done) {
                                if (snapshot.hasData) {
                                  if (snapshot.data.success) {
                                    return Center(
                                        child: Column(
                                      children: <Widget>[
                                        Text(snapshot.data.message),
                                        Text(
                                          'Trip added successfully!',
                                          maxLines: 3,
                                          textAlign: TextAlign.center,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                        RaisedButton(
                                          child: Text('Okay!'),
                                          onPressed: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        HomePage()));
                                          },
                                        ),
                                      ],
                                    ));
                                  } else {
                                    return Column(
                                      children: <Widget>[
                                        SizedBox(
                                          height: 16,
                                        ),
                                        Text(
                                            'Sorry. Something went wrong: ${snapshot.data.message}'),
                                      ],
                                    );
                                  }
                                } else if (snapshot.hasError) {
                                  return Column(
                                    children: <Widget>[
                                      Text(
                                          'Ouch. We messed up. ${snapshot.error}'),
                                    ],
                                  );
                                }
                              }
                              return CircularProgressIndicator();
                            })))));
  }
}

Future<PostNewTrip> submitTrip(String email, int numPeople, String state,
    String city, String startDate, String endDate, String userId) async {
  final http.Response response =
      await http.post('https://onlytrips.herokuapp.com/addTrip',
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: jsonEncode({
            'email': email,
            'trip': {
              'creator': userId,
              'numPeople': numPeople,
              'startDate': startDate,
              'endDate': endDate,
              'destination': {
                'city': city,
                'state': state,
              },
              'budget': {
                'travelCost': '0.00',
                'foodCost': '0.00',
                'lodgingCost': '0.00',
                'miscellaneousCost': '0.00'
              },
            }
          }));
  if (response.statusCode == 200) {
    return PostNewTrip.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to post trip');
  }
}

class PostNewTrip {
  final String message;
  final bool success;

  PostNewTrip({this.success, this.message});

  factory PostNewTrip.fromJson(Map<String, dynamic> json) {
    return PostNewTrip(
      success: json['success'],
      message: json['message'],
    );
  }
}

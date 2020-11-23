import 'dart:convert';
import 'package:http/http.dart' as http; // Use to post to the api server
import 'package:flutter/material.dart';
import 'package:onlytrips/home.dart';
import 'package:onlytrips/shared_prefs.dart';
import 'package:onlytrips/trip.dart';

class BudgetEdit extends StatefulWidget {
  final Trip currTrip;

  BudgetEdit({this.currTrip});

  @override
  _BudgetEditState createState() => _BudgetEditState();
}

final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

class _BudgetEditState extends State<BudgetEdit> {
  double _travelBudget = 0,
      _foodBudget = 0,
      _lodgingBudget = 0,
      _miscBudget = 0;
  Future<BudgetChange> _response;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.lightBlueAccent[400],
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
                ),
              ),
            ],
          ),
        ),
        body: SingleChildScrollView(
            child: (_response == null)
                ? Form(
                    key: _formKey,
                    child: Column(
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
                            color: Colors.blue[200],
                            child: Container(
                              padding: EdgeInsets.all(10.0),
                              child: Column(
                                children: <Widget>[
                                  Row(
                                    children: <Widget>[
                                      Expanded(
                                        child: TextFormField(
                                          validator: (budget) {
                                            Pattern pattern =
                                                '^[0-9]+(\.[0-9]{1,2})?\$';
                                            RegExp regex = new RegExp(pattern);
                                            if (!regex.hasMatch(budget))
                                              return 'Budget must be input as a number.';
                                            else
                                              return null;
                                          },
                                          onSaved: (travelBudget) =>
                                              _travelBudget =
                                                  double.parse(travelBudget),
                                          keyboardType: TextInputType.number,
                                          decoration: InputDecoration(
                                            labelText: "Travel Budget",
                                            hintText:
                                                "${widget.currTrip.budget.elementAt(0).travelCost.toString()}",
                                          ),
                                          textInputAction: TextInputAction.next,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Card(
                            margin: EdgeInsets.all(10.0),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.0)),
                            color: Colors.blue[200],
                            child: Container(
                              padding: EdgeInsets.all(10.0),
                              child: Column(
                                children: <Widget>[
                                  Row(
                                    children: <Widget>[
                                      Expanded(
                                        child: TextFormField(
                                          validator: (budget) {
                                            Pattern pattern =
                                                '^[0-9]+(\.[0-9]{1,2})?\$';
                                            RegExp regex = new RegExp(pattern);
                                            if (!regex.hasMatch(budget))
                                              return 'Budget must be input as a number.';
                                            else
                                              return null;
                                          },
                                          onSaved: (foodBudget) => _foodBudget =
                                              double.parse(foodBudget),
                                          keyboardType: TextInputType.number,
                                          decoration: InputDecoration(
                                            labelText: "Food Budget",
                                            hintText:
                                                "${widget.currTrip.budget.elementAt(0).foodCost.toString()}",
                                          ),
                                          textInputAction: TextInputAction.next,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Card(
                            margin: EdgeInsets.all(10.0),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.0)),
                            color: Colors.blue[200],
                            child: Container(
                              padding: EdgeInsets.all(10.0),
                              child: Column(
                                children: <Widget>[
                                  Row(
                                    children: <Widget>[
                                      Expanded(
                                        child: TextFormField(
                                          validator: (budget) {
                                            Pattern pattern =
                                                '^[0-9]+(\.[0-9]{1,2})?\$';
                                            RegExp regex = new RegExp(pattern);
                                            if (!regex.hasMatch(budget))
                                              return 'Budget must be input as a number.';
                                            else
                                              return null;
                                          },
                                          onSaved: (lodgingBudget) =>
                                              _lodgingBudget =
                                                  double.parse(lodgingBudget),
                                          keyboardType: TextInputType.number,
                                          decoration: InputDecoration(
                                            labelText: "Lodging Budget",
                                            hintText:
                                                "${widget.currTrip.budget.elementAt(0).lodgingCost.toString()}",
                                          ),
                                          textInputAction: TextInputAction.next,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Card(
                            margin: EdgeInsets.all(10.0),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.0)),
                            color: Colors.blue[200],
                            child: Container(
                              padding: EdgeInsets.all(10.0),
                              child: Column(
                                children: <Widget>[
                                  Row(
                                    children: <Widget>[
                                      Expanded(
                                        child: TextFormField(
                                          validator: (budget) {
                                            Pattern pattern =
                                                '^[0-9]+(\.[0-9]{1,2})?\$';
                                            RegExp regex = new RegExp(pattern);
                                            if (!regex.hasMatch(budget))
                                              return 'Budget must be input as a number.';
                                            else
                                              return null;
                                          },
                                          onSaved: (miscBudget) => _miscBudget =
                                              double.parse(miscBudget),
                                          keyboardType: TextInputType.number,
                                          decoration: InputDecoration(
                                            labelText: "Misc Budget",
                                            hintText:
                                                "${widget.currTrip.budget.elementAt(0).miscellaneousCost.toString()}",
                                          ),
                                          textInputAction: TextInputAction.next,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () => {
                              if (_formKey.currentState.validate())
                                {
                                  _formKey.currentState.save(),
                                  Future.delayed(
                                      const Duration(milliseconds: 100),
                                      () async {
                                    await sharedPrefs.init();
                                    setState(() {
                                      _response = submitUpdate(
                                          widget.currTrip.sId,
                                          widget.currTrip.numPeople,
                                          widget.currTrip.destination
                                              .elementAt(0)
                                              .state,
                                          widget.currTrip.destination
                                              .elementAt(0)
                                              .state,
                                          widget.currTrip.startDate,
                                          widget.currTrip.endDate,
                                          sharedPrefs.currUser.userId);
                                    });
                                  }),
                                }
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
                                  "Submit",
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
                    ))
                : FutureBuilder(
                    future: _response,
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.done) {
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
                                            builder: (context) => HomePage()));
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
                              Text('Ouch. We messed up. ${snapshot.error}'),
                            ],
                          );
                        }
                      }
                      return CircularProgressIndicator();
                    })));
  }
}

Future<BudgetChange> submitUpdate(String tripId, int numPeople, String state,
    String city, String startDate, String endDate, String userId) async {
  final http.Response response =
      await http.post('https://onlytrips.herokuapp.com/updateTrip',
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: jsonEncode({
            'id': tripId,
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
    return BudgetChange.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to post trip');
  }
}

class BudgetChange {
  bool success;
  String message;

  BudgetChange({
    this.success,
    this.message,
  });

  BudgetChange.fromJson(Map<String, dynamic> json) {
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

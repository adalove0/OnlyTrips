import 'package:flutter/material.dart';
import 'package:onlytrips/trip.dart';

class TripView extends StatefulWidget {
  final Trip currTrip;

  TripView({this.currTrip});

  @override
  _TripViewState createState() => _TripViewState();
}

class _TripViewState extends State<TripView> {
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
        body: Column(children: <Widget>[
          Card(
            margin: EdgeInsets.all(10.0),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)),
            color: Colors.blue[100],
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
              trailing: Text(
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
            color: Colors.blue[100],
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
              trailing: Text(
                " ${widget.currTrip.numPeople.toString()}",
                style: TextStyle(
                  fontFamily: 'Gotham Light Regular',
                  fontSize: 20.0,
                ),
              ),
            ),
          ),
          if (widget.currTrip.budget.isNotEmpty)
            budgetCards(), // Print budget if budget isn't empty
        ]));
  }
  Widget budgetCards() {
    return Column (
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
            color: Colors.blue[100],
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
            color: Colors.blue[100],
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
                '\$' +
                    widget.currTrip.budget.elementAt(0).foodCost.toString(),
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
            color: Colors.blue[100],
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
                    widget.currTrip.budget
                        .elementAt(0)
                        .lodgingCost
                        .toString(),
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
            color: Colors.blue[100],
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
        ])
      ],
    );
  }
}

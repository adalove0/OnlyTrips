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
          Container(
              child: Text(
            "Destination: ${widget.currTrip.destination}",
            style: TextStyle(
              fontFamily: 'Gotham Light Regular',
              fontSize: 20.0,
            ),
          )),
          Container(
              child: Text(
            "Number of People: ${widget.currTrip.numTravelers.toString()}",
            style: TextStyle(
              fontFamily: 'Gotham Light Regular',
              fontSize: 20.0,
            ),
          )),
          Container(
              child: Text(
            "Budgeting:",
            style: TextStyle(
              fontFamily: 'Gotham Light Regular',
              fontSize: 20.0,
            ),
          )),
          Expanded(
            child: ListView.builder(
              itemCount: widget.currTrip.budgets.length,
              itemBuilder: (BuildContext context, int index) {
                return Card(
                    child: Center(
                        child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "${widget.currTrip.budgets[index].name}: \$${widget.currTrip.budgets[index].amount}",
                    style: TextStyle(
                      fontFamily: 'Gotham Light Regular',
                    ),
                  ),
                )));
              },
            ),
          ),
        ]));
  }
}

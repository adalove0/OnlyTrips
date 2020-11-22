import 'package:flutter/material.dart';
import 'package:onlytrips/menudrawer.dart';
import 'package:onlytrips/newtrip.dart';
import 'package:onlytrips/tripview.dart';
import 'package:onlytrips/trip.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  List<Trip> trips = [
    Trip(destination: "New York", numTravelers: 4),
    Trip(destination: "Russia", numTravelers: 3),
    Trip(destination: "Dubai", numTravelers: 5),
    Trip(destination: "Qatar", numTravelers: 9),
    Trip(destination: "France", numTravelers: 2),
    Trip(destination: "Germany", numTravelers: 1)
  ];

  //Trip testTrip = Trip(destination: "New York", numTravelers: 4);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
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
          ],
        ),
        leading: IconButton(
          icon: Icon(
            Icons.menu,
            semanticLabel: 'menu',
          ),
          onPressed: () => _scaffoldKey.currentState.openDrawer(),
        ),
      ),
      drawer: new NavDrawer(),
      body: ListView.builder(
        itemCount: trips.length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (_) => TripView(currTrip: trips[index]))),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                  elevation: 5.0,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0)),
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.all(50.0),
                    child: Center(
                        child: Text(
                      trips[index].destination,
                      style: TextStyle(
                        fontFamily: 'Marguerite',
                        fontSize: 40.0,
                      ),
                    )),
                  )),
            ),
          );
        },
      ),
      resizeToAvoidBottomInset: false,
      floatingActionButton: new FloatingActionButton(
        onPressed: () => Navigator.push(
            context, MaterialPageRoute(builder: (_) => NewTrip())),
        tooltip: 'New Trip',
        child: new Icon(Icons.add),
        backgroundColor: Colors.lightBlueAccent[400],
      ),
    );
  }
}

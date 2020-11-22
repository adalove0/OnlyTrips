import 'dart:convert';
import 'package:http/http.dart' as http; // Use to post to the api server
import 'package:flutter/material.dart';
import 'package:onlytrips/menudrawer.dart';
import 'package:onlytrips/newtrip.dart';
import 'package:onlytrips/tripview.dart';
import 'package:onlytrips/trip.dart';
import 'package:onlytrips/shared_prefs.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  List<Trip> trips = new List<Trip>();

  @override
  void initState() {
    sharedPrefs.currUser.tripDetails.forEach((element) {
      fetchTrips(element.id);
    });
  }

  void fetchTrips(String tripId) async {
    final http.Response response =
        await http.post('https://onlytrips.herokuapp.com/singleTrip',
            headers: <String, String>{
              'Content-Type': 'application/json; charset=UTF-8',
            },
            body: jsonEncode({
              'id': tripId,
            }));
    if (response.statusCode == 200) {
      GetTrip trip = GetTrip.fromJson(jsonDecode(response.body));
      Trip innerTrip = trip.trip;
      setState(() {
        trips.add(innerTrip);
      });
    } else {
      throw Exception('Unable to get trips');
    }
  }

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
                  child: Padding(
                    padding: const EdgeInsets.all(50.0),
                    child: Center(
                        child: Text(
                      trips[index].destination.elementAt(0).state,
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

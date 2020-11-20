import 'package:flutter/material.dart';

class NewTrip extends StatefulWidget {
  @override
  _NewTripState createState() => _NewTripState();
}

class _NewTripState extends State<NewTrip> {
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
    );
  }
}

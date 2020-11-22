import 'package:flutter/material.dart';

class NewTrip extends StatefulWidget {
  @override
  _NewTripState createState() => _NewTripState();
}

class _NewTripState extends State<NewTrip> {
  DateTime departDate = DateTime.now();
  DateTime returnDate = DateTime.now();

  bool _decideDepartDate(DateTime day) {
    if ((day.isBefore(returnDate.add(Duration(days: 1))))) {
      return true;
    }
    return false;
  }

  bool _decideReturnDate(DateTime day) {
    if ((day.isAfter(departDate.subtract(Duration(days: 1))))) {
      return true;
    }
    return false;
  }

  _selectDepartDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: departDate, // Refer step 1
        firstDate: DateTime(2000),
        lastDate: DateTime(2025),
        selectableDayPredicate: _decideDepartDate);
    if (picked != null && picked != departDate)
      setState(() {
        departDate = picked;
      });
  }

  _selectReturnDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: returnDate, // Refer step 1
        firstDate: DateTime(2000),
        lastDate: DateTime(2025),
        selectableDayPredicate: _decideReturnDate);
    if (picked != null && picked != returnDate)
      setState(() {
        returnDate = picked;
      });
  }

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
        body: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                    width: 110.0,
                    child: Text("Depart:",
                        style: TextStyle(
                            fontSize: 30.0,
                            fontFamily: 'Gotham Light Regular'))),
                SizedBox(width: 10.0),
                Card(
                  color: Colors.lightBlue[100],
                  child: Padding(
                    padding: const EdgeInsets.all(6.0),
                    child: Text(
                      "${departDate.toLocal()}".split(' ')[0],
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                SizedBox(
                  width: 20.0,
                ),
                RaisedButton(
                  onPressed: () => _selectDepartDate(context), // Refer step 3
                  child: Text(
                    'Select date',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                  color: Colors.lightBlueAccent,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                    width: 110.0,
                    child: Text("Return:",
                        style: TextStyle(
                            fontSize: 30.0,
                            fontFamily: 'Gotham Light Regular'))),
                SizedBox(width: 10.0),
                Card(
                  color: Colors.lightBlue[100],
                  child: Padding(
                    padding: const EdgeInsets.all(6.0),
                    child: Text(
                      "${returnDate.toLocal()}".split(' ')[0],
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                SizedBox(
                  width: 20.0,
                ),
                RaisedButton(
                  onPressed: () => _selectReturnDate(context), // Refer step 3
                  child: Text(
                    'Select date',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                  color: Colors.lightBlueAccent,
                ),
              ],
            ),
          ],
        ));
  }
}

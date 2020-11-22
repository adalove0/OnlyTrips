import 'package:flutter/material.dart';

class NewTrip extends StatefulWidget {
  @override
  _NewTripState createState() => _NewTripState();
}

class _NewTripState extends State<NewTrip> {
  DateTimeRange dates =
      DateTimeRange(start: DateTime.now(), end: DateTime.now());
  bool initializedOnce = false;

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
                      child: generateDate(initializedOnce, true)),
                ),
                SizedBox(
                  width: 20.0,
                ),
                RaisedButton(
                  onPressed: () => _dateRangeThing(context), // Refer step 3
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
                    child: generateDate(initializedOnce, false),
                  ),
                ),
                SizedBox(
                  width: 20.0,
                ),
                RaisedButton(
                  onPressed: () => _dateRangeThing(context), // Refer step 3
                  child: Text(
                    'Select Date',
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

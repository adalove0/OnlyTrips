import 'package:flutter/material.dart';
import 'package:onlytrips/editprofile.dart';
import 'login_classes.dart';

class ProfilePage extends StatefulWidget {
  final User currUser;

  ProfilePage({this.currUser});

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  Card createDisplayCard({Icon icon, String text, String value, int size}) {
    return Card(
      margin: EdgeInsets.all(10.0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      child: ListTile(
        leading: icon,
        title: Text(
          text,
          style: TextStyle(
            fontFamily: 'Gotham Light Regular',
            fontSize: 20.0,
          ),
        ),
        trailing: Text(
          value,
          style: TextStyle(
            fontFamily: 'Gotham Light Regular',
            fontSize: 20.0,
          ),
        ),
      ),
    );
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
                'Profile',
                style: TextStyle(
                  fontFamily: 'Gotham Light Regular',
                  fontSize: 25.0,
                ),
              ),
              Text(
                'Page',
                style: TextStyle(
                  fontFamily: 'Marguerite',
                  fontSize: 20.0,
                  color: Colors.lightBlueAccent[400],
                ),
              ),
            ],
          ),
          actions: <Widget>[
            FlatButton(
                onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) =>
                            EditProfile(currUser: widget.currUser))),
                child: Icon(Icons.create))
          ],
        ),
        body: Column(children: <Widget>[
          createDisplayCard(
            icon: Icon(
              Icons.face,
              size: 35.0,
            ),
            text: "Name:",
            value: widget.currUser.name,
          ),
          Card(
            margin: EdgeInsets.all(10.0),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)),
            child: ListTile(
              leading: Icon(
                Icons.alternate_email,
                size: 35.0,
              ),
              title: Text(
                "Email:",
                style: TextStyle(
                  fontFamily: 'Gotham Light Regular',
                  fontSize: 20.0,
                ),
              ),
              trailing: Text(
                widget.currUser.email,
                style: TextStyle(
                  fontFamily: 'Gotham Light Regular',
                  fontSize: 12.0,
                ),
              ),
            ),
          ),
          createDisplayCard(
            icon: Icon(
              Icons.elderly,
              size: 35.0,
            ),
            text: "Age:",
            value: widget.currUser.age.toString(),
          ),
          createDisplayCard(
            icon: Icon(
              Icons.location_city,
              size: 35.0,
            ),
            text: "City:",
            value: widget.currUser.location.elementAt(0).city,
          ),
          createDisplayCard(
            icon: Icon(
              Icons.terrain,
              size: 35.0,
            ),
            text: "State:",
            value: widget.currUser.location.elementAt(0).state,
          ),
          createDisplayCard(
            icon: Icon(
              Icons.flag,
              size: 35.0,
            ),
            text: "Country:",
            value: widget.currUser.location.elementAt(0).country,
          ),
          createDisplayCard(
            icon: Icon(
              Icons.gps_fixed,
              size: 35.0,
            ),
            text: "Zip Code:",
            value: widget.currUser.location.elementAt(0).zip.toString(),
          ),
        ]));
  }
}

import 'package:flutter/material.dart';
import 'package:onlytrips/menudrawer.dart';

class HomePage extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        centerTitle: true,
        title: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Only',
              style: TextStyle(
                fontFamily: 'Heebo',
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
      body: Center(
        // TODO: Make stuff work in the main page
        child: Text('Landing Page'),
      ),
      resizeToAvoidBottomInset: false,
    );
  }
}

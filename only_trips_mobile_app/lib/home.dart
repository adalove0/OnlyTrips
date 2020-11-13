import 'package:flutter/material.dart';
import 'package:onlytrips/menudrawer.dart';

class HomePage extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text('OnlyTrips'),
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

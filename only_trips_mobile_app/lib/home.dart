import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('OnlyTrips'),
        leading: IconButton(
          icon: Icon(
            Icons.menu,
            semanticLabel: 'menu',
          ),
          onPressed: () {
            // TODO: Make menu do stuff
          },
        ),
      ),
      body: Center(
        child: Text('Landing Page'),
      ),
      resizeToAvoidBottomInset: false,
    );
  }
}

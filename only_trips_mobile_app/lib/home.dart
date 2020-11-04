import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  // TODO: Make a collection of cards (102)
  // TODO: Add a variable for Category (104)
  @override
  Widget build(BuildContext context) {
    // TODO: Return an AsymmetricView (104)
    // TODO: Pass Category variable to AsymmetricView (104)
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
      // TODO: Add a grid view (102)
      body: Center(
        child: Text('Landing Page'),
      ),
      resizeToAvoidBottomInset: false,
    );
  }
}

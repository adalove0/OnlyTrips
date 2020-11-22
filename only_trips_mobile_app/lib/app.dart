import 'package:flutter/material.dart';
import 'package:onlytrips/home.dart';
import 'package:onlytrips/shared_prefs.dart';
import 'package:onlytrips/themes.dart';
import 'package:provider/provider.dart';

import 'start.dart';

class OnlyTripsApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final themeNotifier = Provider.of<ThemeNotifier>(context);
    return MaterialApp(
      title: 'OnlyTrips',
      theme: themeNotifier.getTheme(),
      home: (sharedPrefs.isLoggedIn) ? HomePage() : StartPage(),
    );
  }
}

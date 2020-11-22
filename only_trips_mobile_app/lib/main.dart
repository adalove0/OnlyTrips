import 'package:flutter/material.dart';
import 'package:onlytrips/app.dart';
import 'package:onlytrips/shared_prefs.dart';
import 'package:onlytrips/themes.dart';
import 'package:provider/provider.dart';

// Starts app located in lib/app.dart
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await sharedPrefs.init();
  runApp(ChangeNotifierProvider<ThemeNotifier>(
    create: (_) =>
        ThemeNotifier(sharedPrefs.isDarkMode ? darkTheme : lightTheme),
    child: OnlyTripsApp(),
  ));
}

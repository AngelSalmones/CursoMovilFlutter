import 'package:flutter/material.dart';
import 'package:settingsuser/src/pages/home_page.dart';
import 'package:settingsuser/src/pages/settings_page.dart';
import 'package:settingsuser/src/share_prefs/preferences_user.dart';

void main() async{
  final prefs = new PreferencesUser ();
  await prefs.initPrefs();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final prefs = new PreferencesUser ();
    // TODO: implement build
    return MaterialApp(
      title: 'settings',
      initialRoute: prefs.finalPage,
      routes: {
        HomePage.routeName : (BuildContext context) => HomePage(),
        SettingsPage.routeName : (BuildContext context) => SettingsPage(),
      },
    );
  }
}
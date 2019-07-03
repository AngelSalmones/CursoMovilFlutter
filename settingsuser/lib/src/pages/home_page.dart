import 'package:flutter/material.dart';
import 'package:settingsuser/src/pages/settings_page.dart';
import 'package:settingsuser/src/share_prefs/preferences_user.dart';
import 'package:settingsuser/src/widgets/menu_widget.dart';

class HomePage extends StatelessWidget{
  final prefs = new PreferencesUser ();

  static final String routeName = 'home';
  @override
  Widget build(BuildContext context) {
    prefs.finalPage = HomePage.routeName;
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('settings'),
        backgroundColor:(prefs.secundariColor) ? Colors.teal : Colors.blue ,
      ),
      drawer: MenuWidget(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text ('Secundary Color ${prefs.secundariColor}'),
          Divider(),
          Text ('Gener ${prefs.gener}'),
          Divider(),
          Text ('User name${prefs.userName}'),
          Divider(),


        ],
      ),
    );
  }


}
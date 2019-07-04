import 'package:flutter/material.dart';
import 'package:settingsuser/src/pages/home_page.dart';
import 'package:settingsuser/src/pages/settings_page.dart';

class MenuWidget extends StatelessWidget{
  @override

  Widget build(BuildContext context) {
    // TODO: implement build
    return Drawer (
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage('https://live.staticflickr.com/7048/6892048854_e229aab05c_b.jpg'),
                    fit: BoxFit.cover
                ),
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.pages, color: Colors.blue),
            title: Text('Page'),
            onTap: () => Navigator.pushReplacementNamed(context, HomePage.routeName),
          ),
          ListTile(
            leading: Icon(Icons.party_mode, color: Colors.blue),
            title: Text('Party mode'),
            onTap: (){},
          ),
          ListTile(
            leading: Icon(Icons.people, color: Colors.blue),
            title: Text('People'),
            onTap: (){},
          ),
          ListTile(
            leading: Icon(Icons.import_contacts, color: Colors.blue),
            title: Text('contacts'),
            onTap: (){},
          ), ListTile(
              leading: Icon(Icons.settings, color: Colors.blue),
              title: Text('settings'),
              onTap: (){
                Navigator.pop(context);
                Navigator.pushReplacementNamed(context, SettingsPage.routeName);
              }
          ),


        ],
      ),
    );
  }

}
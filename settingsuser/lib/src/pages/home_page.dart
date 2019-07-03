import 'package:flutter/material.dart';

class HomePage extends StatelessWidget{

  static final String routeName = 'home';
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('settings'),
      ),
      body: Column(
        children: <Widget>[
          Text ('Secundary Color'),
          Divider(),
          Text ('Gener'),
          Divider(),
          Text ('User name'),
          Divider(),


        ],
      ),
    );
  }

}
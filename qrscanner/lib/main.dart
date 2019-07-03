import 'package:flutter/material.dart';
import 'package:qrscanner/src/pages/home_page.dart';
import 'package:qrscanner/src/pages/maps_page.dart';

void main () => runApp (MyApp());

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false ,
        title: 'QRreader',
        initialRoute: 'home',
      routes: {
          'home' : (BuildContext context)=> HomePage(),
           'map' : (BuildContext context)=> MapsPage(),
      },
      theme: ThemeData(
        primaryColor: Colors.deepOrange,
      ),
    );
  }

}
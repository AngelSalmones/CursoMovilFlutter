import 'package:flutter/material.dart';
import 'package:qrcode_reader/qrcode_reader.dart';
import 'package:qrscanner/src/models/scan_model.dart';

import 'package:qrscanner/src/pages/directions_page.dart';
import 'package:qrscanner/src/pages/map_page.dart';
import 'package:qrscanner/src/providers/db_provider.dart';

class HomePage extends StatefulWidget{
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  int currentindex = 0;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('QRscaner'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.delete_forever),
            onPressed: (){

            },
          ),
        ],
      ),
      body: _callpage(currentindex),
      bottomNavigationBar: _createNavigatorBar(),
      floatingActionButton : FloatingActionButton(
        child: Icon(Icons.filter_center_focus,),
        onPressed: _scanQR,
        backgroundColor: Theme.of(context).primaryColor,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
  _scanQR () async{
    //https: https://www.google.com.mx
    //geo:21.912081434771387,-102.31256976565248
    String futureString = 'https://www.google.com.mx';
//
//    try{
//      futureString = await new QRCodeReader().scan();
//    }catch(e){
//      futureString = e.toString();
//    }
//
    if (futureString != null){
      final scan = ScanModel(value: futureString);

      DBProvider.db.newScanRaw(scan);

    }

  }

  Widget _createNavigatorBar(){

    return BottomNavigationBar(
      currentIndex: currentindex,
      onTap: (index){
        setState(() {
          currentindex = index;
        });
      },
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.map),
          title: Text('Map')
        ),
        BottomNavigationBarItem(
            icon: Icon(Icons.brightness_5),
            title: Text('brighness')
        ),
      ],
    );
  }

  Widget _callpage (int nowpage){
    switch(nowpage){
      case 0 : return MapPage();
      case 1 : return DirectionsPage();

      default : return MapPage();
    }
  }
}
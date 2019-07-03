import 'package:flutter/material.dart';
import 'package:qrscanner/src/models/scans_model.dart';

class MapsPage extends StatelessWidget{
  @override
   Widget build(BuildContext context) {
    final ScanModel scan = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text (' QR'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.my_location),
            onPressed: (){
              
            },
          ),
        ],
      ),
      body: Center(
        child: Text(scan.value),
      ),
    );
  }
}
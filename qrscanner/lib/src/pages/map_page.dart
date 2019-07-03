import 'package:flutter/material.dart';
import 'package:qrscanner/src/providers/db_provider.dart';

class MapPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return FutureBuilder(
      future: DBProvider.db.getAllScans(),
      builder: (BuildContext context , AsyncSnapshot <List<ScanModel>> snapshot){
        if (!snapshot.hasData){
          return Center(
            child: CircularProgressIndicator(),
          );
        }

        final scans = snapshot.data;
        if (scans.length == 0){
          return Center(
            child: Text('No Data'),
          );
        }

        return ListView.builder(
          itemCount: scans.length,
          itemBuilder: (context ,int  i)=> ListTile(
            leading:  Icon (Icons.cloud_queue, color: Theme.of(context).primaryColor,),
            title: Text(scans[i].value),
            trailing: Icon (Icons.keyboard_arrow_right, color: Colors.grey,),
          ),
        );

      },
    );
  }
  
}
import 'package:flutter/material.dart';
import 'package:qrscanner/src/bloc/scan_bloc.dart';
import 'package:qrscanner/src/providers/db_provider.dart';
import 'package:qrscanner/src/utils/util.dart' as utils;

class MapPage extends StatelessWidget{

  final scansBloc = new ScansBloc();
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return StreamBuilder<List<ScanModel>>(
      stream: scansBloc.scansStream,
      builder: (BuildContext context, AsyncSnapshot<List<ScanModel>> snapshot){
        if (!snapshot.hasData){
          return Center(
            child: CircularProgressIndicator(),
          );
        }

        final scans = snapshot.data;
        if (scans.length == 0){
          return Center(
            child: Text('no data'),
          );
        }

        return ListView.builder(
           itemCount: scans.length,
          itemBuilder: (context, i) {
           return Dismissible(
             key: UniqueKey(),
             background: Container(color: Colors.red,),
             onDismissed: (direction) => scansBloc.deleteScan(scans[i].id) ,
             child: ListTile(
                leading: Icon(Icons.cloud_queue, color: Theme
                    .of(context)
                    .primaryColor,),
                subtitle: Text("ID: ${scans[i].id}"),
                title: Text(scans[i].value),
                trailing: Icon(Icons.keyboard_arrow_right, color: Colors.grey,),
               onTap: (){
                  utils.launchURL(context,scans[i]);
               },
              ),
           );
          }
        );

      },
    );
  }
  
}
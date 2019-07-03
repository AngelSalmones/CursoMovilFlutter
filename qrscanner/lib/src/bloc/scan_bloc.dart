

import 'dart:async';

import 'package:qrscanner/src/providers/db_provider.dart';

class ScansBloc {

  static final ScansBloc _singleton  = new ScansBloc._internal();

  factory ScansBloc(){
    return _singleton;
  }

  ScansBloc._internal (){
    catchScans();
    //
  }

  final _scansController = StreamController<List<ScanModel>>.broadcast();

  Stream <List<ScanModel>>get scansStream => _scansController.stream;

  dispose (){
    _scansController?.close();
  }


  catchScans() async {
    _scansController.sink.add(await DBProvider.db.getAllScans());
  }

  addScan(ScanModel scan)async{
    await DBProvider.db.newScan(scan);
    catchScans();
  }


  deleteScan(int id) async {

    await DBProvider.db.deleteScan(id);
    catchScans();
  }

  deleteScansAll() async{
    DBProvider.db.deleteAll();
    catchScans();
  }
}

import 'dart:io';

import 'package:path/path.dart';
import 'package:qrscanner/src/models/scans_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
export 'package:qrscanner/src/models/scans_model.dart';

class DBProvider {

  static Database  _database;
  static final DBProvider db = DBProvider._private();

  DBProvider._private();

  Future < Database > get database async{
    if (_database != null) return _database;

    _database = await initDB();
    return _database;
  }

  initDB () async{

    Directory documentsDirectory = await getApplicationDocumentsDirectory();

    final path = join( documentsDirectory.path, 'ScansDB.db' );

    return await openDatabase(
        path,
        version: 8,
        onOpen: (db) {},
        onCreate: ( Database db, int version ) async {
          await db.execute('CREATE TABLE Scans (id INTEGER PRIMARY KEY, type TEXT, value TEXT)');
        }

    );

  }

  newScanRaw( ScanModel newScan)async{

    final db  = await database;

    final res = await db.rawInsert(
        "INSERT INTO Scans (id,type,value) "
            'VALUES ( ${ newScan.id }, "${ newScan.type }", "${ newScan.value }")'
    );
    return res;
  }

  newScan (ScanModel newScan) async{
    final db = await database;
    final result = await db.insert('Scans', newScan.toJson());
    return result;
  }

  //SELECT

  getScanId (int id) async{

    final db = await database;

    final result = await db.query('Scans',where: 'id = ?', whereArgs: [id]);

    return result.isEmpty? ScanModel.fromJson(result.first) : null;

  }

  Future <List<ScanModel>> getAllScans() async{
    final db = await database;
    final result = await db.query('Scans');

    List<ScanModel> list = result.isNotEmpty ? result.map((c)=> ScanModel.fromJson(c)).toList() : [];

    return list;
  }

  Future <List<ScanModel>> getScansForType(String type) async{
    final db = await database;
    final result = await db.rawQuery("SELECT * FROM Scans WHERE type = '$type'");

    List<ScanModel> list = result.isEmpty ? result.map((s)=> ScanModel.fromJson(s)).toList() : [];

    return list;
  }

  Future <int> updateScan (ScanModel newScan) async {
    final db = await database;
    final result = await db.update('Scans', newScan.toJson(),where : 'id = ? ', whereArgs:  [newScan.id]);

    return result;
  }

  //delete

  Future<int> deleteScan (int id)async{
    final db = await database;
    final result = await db.delete('Scans',where: 'id = ?',whereArgs: [id]);

    return result;
  }

  Future<int> deleteAll ()async{
    final db = await database;
    final result = await db.rawDelete('DELETE FROM Scans');
    return result;
  }

}
import 'package:url_launcher/url_launcher.dart';
import 'package:qrscanner/src/models/scans_model.dart';
import 'package:flutter/material.dart';

launchURL(BuildContext context, ScanModel scan) async {
  if (scan.type == 'http'){
    
 
  if (await canLaunch(scan.value)) {
    await launch(scan.value);
  } else {
    throw 'Could not launch ${scan.value}';
  }
  }else{
    Navigator.pushNamed(context, 'map',arguments: scan);
  }
}
import 'package:flutter/material.dart';

class HomePages extends StatelessWidget{

  final texttap = new TextStyle( fontSize: 25.0);
  final int numtaps = 0;
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('Title'),
        centerTitle: true ,

      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Number of taps',
                style: texttap,
            ),
            Text(numtaps.toString(),
            style: TextStyle(fontSize: 30.0),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(

        child: Icon(Icons.add),
          onPressed: (){
          //  numtaps = numtaps+1;


          }
          ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

}
import 'package:flutter/material.dart';


class CounterPage extends StatefulWidget {

  @override
  createState () => _CounterPageState();


}

class _CounterPageState extends State<CounterPage>{

  final _texttap = new TextStyle( fontSize: 25.0);
  int _numtaps = 0;
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('Counter'),
        centerTitle: true ,

      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Number of taps',
              style: _texttap,
            ),
            Text(_numtaps.toString(),
              style: TextStyle(fontSize: 30.0),
            ),
          ],
        ),
      ),
      floatingActionButton: _createbottom(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  Widget _createbottom () {
    var size = MediaQuery.of(context).size.width;
    return Row (
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        Container(child: FloatingActionButton( child: Icon(Icons.exposure_zero), onPressed: _reset ),margin: EdgeInsets.only(left: 10),),
        Expanded(child: SizedBox()),
        FloatingActionButton( child: Icon(Icons.add), onPressed: _add),
        Expanded(child: SizedBox()),
        Container(child: FloatingActionButton( child: Icon(Icons.remove), onPressed:_rest ), margin: EdgeInsets.only(right: 10,),),
    ],);


  }

  void _add () {
    setState(() {
      _numtaps ++;
    });

  }

  void _rest () {
    setState(() {
      if (_numtaps>0) {
        _numtaps --;
      }
      else{
        _numtaps = 0;
      }
    });
  }

  void _reset (){
    setState(() {
      _numtaps = 0;
    });
  }

}
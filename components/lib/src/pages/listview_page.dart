import 'dart:async';

import 'package:flutter/material.dart';


class  ListviewPage extends StatefulWidget {
  @override
  _ListviewPageState createState () => _ListviewPageState();

}

class _ListviewPageState extends State <ListviewPage> {

  ScrollController _scrollcontroller = new ScrollController();

  List<int> _listnumbers = new List();
  int _finalitem = 0;
  bool _isloading = false;

  @override
  void initState() {
    super.initState();
    _addten();

    _scrollcontroller.addListener((){
      if (_scrollcontroller.position.pixels == _scrollcontroller.position.maxScrollExtent){
       // _addten();
        fetchDate();
      }
    });
  }
  @override

  void dispose(){
    super.dispose();
    _scrollcontroller.dispose();
  }
  Widget build (BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('Listview'),
      ),
      body:Stack(
        children: <Widget>[
          _createList(),
          _crateLoading(),
        ],
      ),

    );
  }

  Widget _createList (){
    return RefreshIndicator(
      onRefresh: getpage,
      child: ListView.builder(
        controller: _scrollcontroller,
        itemCount: _listnumbers.length,
        itemBuilder: (BuildContext context, int index){
          final images = _listnumbers[index];

          return FadeInImage(
            image: NetworkImage('https://picsum.photos/id/$images/500/300'),
            placeholder: AssetImage('assets/jar-loading.gif'),
          );
        },
      ),
    );
  }

  Future <Null> getpage () async {
    final duration = new Duration(seconds: 2);
    new Timer (duration, (){

      _listnumbers.clear();
      _finalitem++;
      _addten();

    });
    return Future.delayed(duration);
  }

  _addten(){
    for (int i = 0 ; i<10;i++){
      _finalitem++;
      _listnumbers.add(_finalitem);
    }
    setState(() {

    });
  }

  Future <Null> fetchDate () async {

    _isloading = true;
    setState(() {
    });
    final duration = new Duration(seconds: 2);
    new Timer(duration, requestHTTP);

  }

  void requestHTTP () {
    _isloading = false;
    
    _scrollcontroller.animateTo(
      _scrollcontroller.position.pixels + 100,
      curve: Curves.fastOutSlowIn,
      duration: Duration(milliseconds: 250),
    );

    _addten();
  }
  Widget _crateLoading(){
    if (_isloading){
       return Column(
         mainAxisSize: MainAxisSize.max,
       mainAxisAlignment: MainAxisAlignment.end,
       children: <Widget>[
         Row(
           mainAxisAlignment: MainAxisAlignment.center,
           children: <Widget>[
             CircularProgressIndicator(),
           ],
         ),
          SizedBox(height: 15.0,),
       ],
      );
    }else
      {
        return Container();
      }
  }
}
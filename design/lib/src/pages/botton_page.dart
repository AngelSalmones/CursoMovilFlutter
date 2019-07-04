import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';


class BottonPage extends StatelessWidget{
 

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Stack(
      children: <Widget>[
        _backGroundApp(),
        SingleChildScrollView(
          child: Column(
            children: <Widget>[
              _titles(),
              _bottonCircle(),
            ],
          ),
        ),
      ],
    ),
      bottomNavigationBar:_bottonNavigationBar(context),
    );
  }

  Widget _backGroundApp (){
    final gradients = Container(
      width: double.infinity,
      height: double.infinity,

      decoration: BoxDecoration(
        gradient: LinearGradient(
            colors:[
              Color.fromRGBO(52, 54, 101, 1.0),
              Color.fromRGBO(35, 37, 57, 1.0),
            ],
          begin:FractionalOffset(0.1, 0.6),
          end: FractionalOffset(0.0, 1.0) ,
        )
      ),
    );

    final pinkBox = Transform.rotate(
      angle: -pi/ 5.0,
      child:Container(
        height: 360.0,
        width: 360.0,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(90.0),
            gradient: LinearGradient(
              colors: [
                Color.fromRGBO(236, 98, 188, 1.0),
                Color.fromRGBO(241, 142, 172, 1.0),
              ],
            )
        ),
      ) ,
    );

    return Stack(
      children: <Widget>[
        gradients,
        Positioned(
          top: -100.0,
          left: -20.0,
          child: pinkBox,
        ),

      ],
    );

  }
  Widget _titles(){

    return SafeArea(
      child: Padding(
        padding: EdgeInsets.all(20.0),
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text('Classify transaction',style: TextStyle(color: Colors.white, fontSize: 30.0,fontWeight: FontWeight.bold,inherit: false),),
              SizedBox(height: 20.0,),
              Text('Classify this transaction int a particular ctegory',style: TextStyle(color: Colors.white, fontSize: 18.0,inherit: false),),
            ],
          ),
        ),
      ),
    );
  }

  Widget _bottonNavigationBar(BuildContext context){
    return Theme(
      data: Theme.of(context).copyWith(
        canvasColor: Color.fromRGBO(55, 57, 84, 1.0),
        primaryColor: Colors.pinkAccent,
        textTheme: Theme.of(context).textTheme.copyWith(
          caption: TextStyle(color: Color.fromRGBO(116, 117, 152, 1.0))
        )
      ),
      child: BottomNavigationBar(items: [
         BottomNavigationBarItem(
           icon: Icon(Icons.bubble_chart,size: 30.0,),
           title: Container()
         ),
        BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today,size: 30.0,),
            title: Container()
        ),
        BottomNavigationBarItem(
            icon: Icon(Icons.supervised_user_circle,size: 30.0,),
            title: Container()
        ),
       ],
      ),
    );
  }

  Widget _bottonCircle(){

    return Table(
      children: [
        TableRow(
          children: [
            _createButtonCircle(Colors.blue, Icons.bubble_chart, 'General'),
            _createButtonCircle(Colors.purple, Icons.date_range, 'date'),
          ]
        ),
        TableRow(
            children: [
              _createButtonCircle(Colors.red, Icons.gradient, 'table'),
              _createButtonCircle(Colors.orange, Icons.laptop, 'Machine'),
            ]
        ),
        TableRow(
            children: [
              _createButtonCircle(Colors.lightGreenAccent, Icons.label_important, "Next"),
              _createButtonCircle(Colors.yellow,Icons.settings,"settings"),
            ]
        ),
        TableRow(
            children: [
              _createButtonCircle(Colors.cyanAccent, Icons.play_arrow, ' Music'),
              _createButtonCircle(Colors.pink,Icons.add,"actions"),
            ]
        ),
      ],
    );
  }
  
  Widget  _createButtonCircle( Color color ,IconData icon , String text ) {



    return ClipRect(
      child: BackdropFilter(
        filter: ImageFilter.blur( sigmaX: 10.0, sigmaY: 10.0),
        child: Container(
          height: 180.0,
          margin: EdgeInsets.all(15.0),
          decoration: BoxDecoration(
            color: Color.fromRGBO(62, 66, 107, 0.7),
                borderRadius: BorderRadius.circular(20.0)
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              CircleAvatar(
                child: Icon(icon, color:  Colors.white ,size:30.0 ,),
                radius: 35.0,
                backgroundColor: color,
              ),
              Text(text,style: TextStyle(color:color),),
            ],
          ),
        ),
      ),
    );
  }

}
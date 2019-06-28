import 'package:flutter/material.dart';


class AvaterPage extends StatelessWidget {

  @override

  Widget build(BuildContext context) {

    return Scaffold(
      appBar:AppBar (
      title: Text ('Avatar Page'),
        actions: <Widget>[
          Container(
            padding: EdgeInsets.all(8.0),
            child: CircleAvatar(
              backgroundImage: NetworkImage('https://cdn.vox-cdn.com/thumbor/NBBwGYs9nr-8xQLB0OPIE11TR0o=/0x0:2237x3000/1200x800/filters:focal(950x463:1306x819)/cdn.vox-cdn.com/uploads/chorus_image/image/62327196/GettyImages-479042496.0.1542048739.0.jpg'),
              radius: 21.0,
            ),
          ),
          Container(
          margin: EdgeInsets.only(right: 10.0),
          child: CircleAvatar(
            child: Text('SL',style: TextStyle(color: Colors.white),),
            backgroundColor: Colors.lightGreen,
          ),
        ),
        ],
      ),
      body: Center(
        child: FadeInImage (
          image : NetworkImage('https://media.wired.com/photos/5be9d68a5d7c6a7b81d79e25/master/pass/StanLee-610719480.jpg'),
          placeholder: AssetImage('assets/jar-loading.gif'),
          fadeInDuration: Duration(milliseconds: 200),
        ),
      ),
    );
  }
}
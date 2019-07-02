import 'package:flutter/material.dart';


class CardPage extends StatelessWidget{
  final _designedyes = TextStyle(
    color: Colors.green
  );

  final _designedno = TextStyle(
    color: Colors.red
  );

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Cards'),
      ),
      body: ListView(
        padding: EdgeInsets.all(15.0),
        children: <Widget>[
          _cardtype1(),
          SizedBox(height:30.0,),
          _cardtype2(),

        ],
      ),
    );
  }

  Widget _cardtype1 () {
    
    return Card (
      elevation: 10.0,
     shape: RoundedRectangleBorder(
       borderRadius: BorderRadius.circular(15.0)
     ),
     child: Column (
       children: <Widget>[
         ListTile(
           leading: Icon(Icons.photo_album,color: Colors.indigo,),
           title: Text ('The Title'),
           subtitle: Text ('This is the descriptions of the cards into flutter'),
         ),
         Row (
           mainAxisAlignment: MainAxisAlignment.end,
           children: <Widget>[
             FlatButton(
               child: Text('Yes',style: _designedyes,),
               onPressed: (){

               },
             ),
             FlatButton(
                child: Text('No',style: _designedno,),
                 onPressed: (){
                  },
              ),
           ],
         ),
       ],
     ) , 
    );
    
  }

  Widget _cardtype2 () {

    final card = Container (

    child: Column(
    children: <Widget>[
    FadeInImage(
    image: NetworkImage('https://static.photocdn.pt/images/articles/2017_1/iStock-545347988.jpg'),
    placeholder: AssetImage('assets/jar-loading.gif'),
    fadeInDuration: Duration ( milliseconds: 200),
    height: 280.0,
    fit: BoxFit.cover,
    ),
//           Image(
//             image: NetworkImage('https://static.photocdn.pt/images/articles/2017_1/iStock-545347988.jpg'),
//           ),
    Container (
    padding: EdgeInsets.all(10.0),
    child: Text ('things'),
    ),

    ],
    ),
    );
    return Container (

    child: ClipRRect(
      borderRadius: BorderRadius.circular(30.0),
      child: card,
    ),
    decoration: BoxDecoration(
      color: Colors.white,
      boxShadow: <BoxShadow>[
        BoxShadow(
          color: Colors.black26,
          blurRadius: 5.0,
          spreadRadius: 2.0,
          offset: Offset(2.0,10.0),
        ),
      ],
      borderRadius: BorderRadius.circular(30.0),

    ),
    );

  }

}
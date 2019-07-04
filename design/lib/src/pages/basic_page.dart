import 'package:flutter/material.dart';


class BasicPage extends StatelessWidget{
  final styleTitle = TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold);
  final styleSubTitle = TextStyle(fontSize: 18.0, color : Colors.grey);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            _createImage(),
            SizedBox(height: 10.0,),
            _createtitle(),
            _createactions(),
            _creatText(),
            _creatText(),
            _creatText(),
            _creatText(),
            _creatText(),
            _creatText(),

          ],
        ),
      ),
    );
  }

  Widget _createImage(){
    return  Image(
      image: NetworkImage('https://www.dzoom.org.es/wp-content/uploads/2017/07/seebensee-2384369-810x540.jpg'),
    );

  }

  Widget _createtitle(){
    return SafeArea(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 20.0),
        child: Row(
          children: <Widget>[
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text('Beautiful lake', style: styleTitle,),
                  SizedBox(height: 8.0,),
                  Text('In this lake you can swim ', style: styleSubTitle,),
                ],
              ),
            ),
            Icon (Icons.star, color: Colors.red,size: 30.0,),
            Text('41',style: TextStyle(fontSize: 20.0),)
          ],
        ),
      ),
    );
  }

  Widget _createactions(){

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        _action(Icons.call,'Call'),
        _action(Icons.near_me,'Route'),
        _action(Icons.share, 'Share'),
      ],
    );
  }

  Widget _action (IconData icon, String text){

    return Column(
      children: <Widget>[
        Icon(icon, color: Colors.lightBlue,size: 40.0,),
        SizedBox(height: 10.0,),
        Text(text , style: TextStyle(fontSize: 15.0, color:Colors.lightBlue,)),
      ],
    );
  }

  Widget _creatText (){
    return SafeArea(
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 20.0,horizontal: 40.0),
          child: Text('A lake is an area filled with water, localized in a basin, that is surrounded by land, apart from any river or other outlet that serves to feed or drain the lake. ... Lakes can be contrasted with rivers or streams, which are usually flowing. Most lakes are fed and drained by rivers and streams.',
          textAlign: TextAlign.justify,)),
    );
  }
}
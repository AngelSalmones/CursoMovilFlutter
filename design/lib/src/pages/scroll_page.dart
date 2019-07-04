import 'package:flutter/material.dart';

class ScrollPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: PageView(
        scrollDirection: Axis.vertical,
        children: <Widget>[
          _pageone(),
          _pagetwo(),
        ],
      ),
    );
  }

  Widget _pageone (){

    return Stack(
      children: <Widget>[
        _colorBackGround(),
        _imageBackGround(),
        _texts(),

      ],
    );
  }

  Widget _colorBackGround () {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: Color.fromRGBO(108, 192, 218, 1.0),
    );
  }

  Widget _imageBackGround(){
    return Container(
      width: double.infinity,
      height: double.infinity,
      child: Image(
          image: AssetImage('assets/scroll-1.png'),
      fit: BoxFit.cover,),

    );
  }

  Widget _texts() {
    final styletext = TextStyle(color: Colors.white,fontSize: 50.0);
    return SafeArea(
      child: Column(
        children: <Widget>[
          Text('11°',style: styletext,),
          Text('Wensday',style: styletext,),
          Expanded(
            child: Container(),
          ),
          Icon(Icons.keyboard_arrow_down,size: 70.0,color: Colors.white,),
        ],
      ),
    );
  }

  Widget _pagetwo(){
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: Color.fromRGBO(108, 192, 218, 1.0),
      child: Center(
        child: RaisedButton(
          shape: StadiumBorder(),
          color: Colors.blue,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 40.0,vertical: 15.0),
            child: Text('Welcome',style: TextStyle(color: Colors.white,fontSize: 20.0),),
          ),
          onPressed: (){

          },
        ),
      ),
    );
  }

}
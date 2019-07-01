import 'package:flutter/material.dart';

class SliderPage extends StatefulWidget{
  @override
  _SliderPageState createState () => _SliderPageState ();

}

class _SliderPageState extends State <SliderPage> {
  double _valueslider  = 100.0;
  bool _lockcheck = false;

  @override
  Widget build (BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text ('Sliders'),
      ),
      body: Container(
        padding: EdgeInsets.only(top: 50.0),
        child: Column(
          children: <Widget>[
            _createSlider(),
            _createCheckBox(),
            _createSwitch(),
            Expanded(
                child: _createimage()),
          ],
        ),
      ),
    );
}

 Widget _createSlider () {
    return Slider(
      activeColor: Colors.blueAccent,
      label: 'Size of image',
      value: _valueslider,
      min: 10.0,
      max: 400.0,
      onChanged: (_lockcheck) ? null : ( count ){
        setState(() {
          _valueslider = count;
          print (count);
        });
      },
    );
 }
 Widget _createimage () {
    return Image (
      image: NetworkImage('http://mouse.latercera.com/wp-content/uploads/2019/05/batman-6.jpg'),
      width: _valueslider,
      fit: BoxFit.contain,
    );
 }

 Widget _createCheckBox () {
//    return Checkbox(
//      value: _lockcheck,
//      onChanged: ( value ){
//        setState(() {
//          _lockcheck = value;
//        });
//      },
//    );

    return CheckboxListTile(
      title: Text ('Lock size of image') ,
      value: _lockcheck,
      onChanged: (value){
        setState(() {
          _lockcheck = value;
        });
      },
    );
 }
 Widget _createSwitch () {
    return SwitchListTile(
      title: Text ('Lock size of image') ,
      value: _lockcheck,
      onChanged: (value){
        setState(() {
          _lockcheck = value;
        });
      },
    );
 }
}
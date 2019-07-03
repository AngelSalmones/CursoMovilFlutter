import 'package:flutter/material.dart';
import 'package:settingsuser/src/share_prefs/preferences_user.dart';
import 'package:settingsuser/src/widgets/menu_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';


class SettingsPage extends StatefulWidget{
  static final String routeName = 'settings';

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {

  bool _secundarycolor;
  int _gener ;
  String _name = 'Petter';

  TextEditingController _textController;

  final prefs = new PreferencesUser ();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    prefs.finalPage = SettingsPage.routeName;
    _gener = prefs.gener;
    _secundarycolor = prefs.secundariColor;
    _textController = new TextEditingController(text: prefs.userName);
  }

  _setSelectdRadio (int value){
    prefs.gener = value;
    _gener = value;
        setState(() { });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
        backgroundColor:(prefs.secundariColor) ? Colors.teal : Colors.blue ,
      ),
      drawer: MenuWidget(),
      body: ListView(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(5.0),
            child: Text('Settings',style: TextStyle(fontSize: 45.0,fontWeight: FontWeight.bold),),
          ),
          Divider(),
          SwitchListTile(
            value: _secundarycolor,
            title: Text('Secundary color'),
            onChanged: (value){
              _secundarycolor = value;
              setState(() {
                prefs.secundariColor = value;
              });
            },
          ),
          RadioListTile(
            value: 1 ,
            title: Text('male'),
            groupValue: _gener,
            onChanged: _setSelectdRadio,
          ),
          RadioListTile(
            value: 2,
            title: Text('female'),
            groupValue: _gener,
            onChanged: _setSelectdRadio
          ),
          Divider(),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: TextField(
              controller: _textController,
              decoration: InputDecoration(
                labelText: 'name',
                helperText: 'name of people'
              ),
              onChanged: (value){
                prefs.userName=value;
              },
            ),
          ),
        ],
      )
    );
  }
}
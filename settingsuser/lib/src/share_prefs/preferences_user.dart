import 'package:shared_preferences/shared_preferences.dart';

class PreferencesUser {

  static final PreferencesUser _instance = new PreferencesUser._internal();

  factory PreferencesUser(){
    return _instance;
  }

  PreferencesUser._internal();

  SharedPreferences _prefs;

  initPrefs() async{
    this._prefs = await SharedPreferences.getInstance();
  }

//  bool _secundariColor;
//  int _gener;
//  String _name;

// GET Y SET
get gener {
    return _prefs.getInt('gener')?? 1;
}
set gener (int value){
    _prefs.setInt('gener', value);
}

// GET Y SET
  get secundariColor {
    return _prefs.getBool('secundariColor')?? false;
  }
  set secundariColor (bool value){
    _prefs.setBool('secundariColor', value);
  }

  // GET Y SET
  get userName {
    return _prefs.getString('name')?? ' ';
  }
  set userName (String value){
    _prefs.setString('name', value);
  }

  // GET Y SET
  get finalPage {
    return _prefs.getString('finalpage')?? 'home';
  }
  set finalPage (String value){
    _prefs.setString('finalpage', value);
  }

}
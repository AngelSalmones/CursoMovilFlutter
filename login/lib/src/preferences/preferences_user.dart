
import 'package:shared_preferences/shared_preferences.dart';

class PreferencesUser {

  static final PreferencesUser _instance = new PreferencesUser._internal();

  factory PreferencesUser() {
    return _instance;
  }

  PreferencesUser._internal();

  SharedPreferences _prefs;

  initPrefs() async {
    this._prefs = await SharedPreferences.getInstance();
  }

  // GET y SET of name
  get token {
    return _prefs.getString('token') ?? '';
  }

  set token( String value ) {
    _prefs.setString('token', value);
  }


  // GET y SET of the login
  get finalpage {
    return _prefs.getString('finalpage') ?? 'login';
  }

  set finalpage( String value ) {
    _prefs.setString('finalpage', value);
  }

}


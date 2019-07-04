import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:login/src/preferences/preferences_user.dart';

 class UserProvider {
    final String _firebaseToken = 'AIzaSyB0UI3ckZThI28qzh7OBFiNsFZkFegmeDA';
    final _prefs = new PreferencesUser();
    Future <Map<String,dynamic>> login(String email, String password) async{

     final authDate = {
       'email' :email,
       'password' : password,
       'returnSecureToken' :true
     };

     final result = await http.post('https://www.googleapis.com/identitytoolkit/v3/relyingparty/signupNewUser?key=$_firebaseToken',
         body: json.encode(authDate)
     );

     Map <String,dynamic> decodeResp = json.decode(result.body);

     if (decodeResp.containsKey('idToken')){
       _prefs.token = decodeResp ['idToken'];
       return {'ok': true , 'token': decodeResp['idToken']};
     }else
     {
       return{'ok':false, 'message':decodeResp['error']['message']};
     }


   }




  Future <Map<String,dynamic>> newUser (String email, String password)async{

    final authDate = {
      'email' :email,
      'password' : password,
      'returnSecureToken' :true
    };

    final result = await http.post('https://www.googleapis.com/identitytoolkit/v3/relyingparty/signupNewUser?key=$_firebaseToken',
    body: json.encode(authDate)
    );

    Map <String,dynamic> decodeResp = json.decode(result.body);



    if (decodeResp.containsKey('idToken')){
      _prefs.token = decodeResp ['idToken'];
      return {'ok': true , 'token': decodeResp['idToken']};
    }else
      {
        return{'ok':false, 'message':decodeResp['error']['message']};
      }


  }


 }
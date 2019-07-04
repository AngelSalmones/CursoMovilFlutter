
import 'dart:async';
import 'dart:io';

import 'package:firebase_messaging/firebase_messaging.dart';


class PushNotificationProvider {

   FirebaseMessaging _firebaseMessaging = FirebaseMessaging();


   final _messageStreamController = StreamController<String>.broadcast();

   Stream<String> get message => _messageStreamController.stream;

   initNotifications(){

     _firebaseMessaging.requestNotificationPermissions();


     _firebaseMessaging.getToken().then((token){

       print('================================');
       print(token);

       //    ea3-nDdftF4:APA91bGmhhki4KUeCwb9IwdhvDi8_hXC4cuKz6uwqjd5lvF4eDcioRI2VuWgKe14P-L_bQO3sX0B-qfU9wEWsoZ2TuM1gUtRRZHNKY48VMCxkX3FzQsvQT_stYDsBIdGA8-HIn3EQqEH
     });

     _firebaseMessaging.configure(
       onMessage: (Map<String, dynamic> message) async{
         print('==============MESSAGE===================');
         print("onMessage: $message");
         String argument = 'no-data';
         if (Platform.isAndroid){
           argument = message['data']['Comida'] ?? 'no-data';
         }

         _messageStreamController.sink.add(argument);
       },
       onLaunch: (Map<String, dynamic> message)async{
         print('==============Lauch===================');
         print("onLaunch: $message");
         final argument = message['data']['Comida'];
         _messageStreamController.sink.add(argument);
       },
       onResume: (Map<String, dynamic> message)async{
       print('==============Resume===================');
       print("onResume: $message");
     }
      );


   }
   dispose(){
     _messageStreamController?.close();
   }

}
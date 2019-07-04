import 'package:flutter/material.dart';
import 'package:login/src/blocs/provider.dart';
import 'package:login/src/pages/home_page.dart';
import 'package:login/src/pages/login_page.dart';
import 'package:login/src/pages/product_page.dart';
import 'package:login/src/pages/signup-page.dart';
import 'package:login/src/preferences/preferences_user.dart';

void main()async {

  final prefs = new PreferencesUser();
  await prefs.initPrefs();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final prefs = new PreferencesUser();

    return  Provider(child:MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Login',
      initialRoute: 'login',
      routes: {
        'signup' :(BuildContext context) => SignupPage(),
        'login': (BuildContext context) => LoginPage(),
        'home' : (BuildContext context) => HomePage(),
        'product' : (BuildContext context) => ProductPage(),

      },
      theme: ThemeData(primaryColor: Colors.deepPurple),
    ),
    );
  }
}

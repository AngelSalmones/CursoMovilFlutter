import 'package:flutter/material.dart';
import 'package:login/src/blocs/provider.dart';
import 'package:login/src/pages/home_page.dart';
import 'package:login/src/pages/login_page.dart';
import 'package:login/src/pages/product_page.dart';
import 'package:login/src/pages/signup-page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
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

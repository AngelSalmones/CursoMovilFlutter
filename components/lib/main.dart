import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter/material.dart';

import 'package:components/src/pages/alert_page.dart';
import 'package:components/src/routes/routes.dart';
//import 'package:components/src/pages/home_temp.dart';
void main () => runApp(MyApp());

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: [
        // ... app-specific localization delegate[s] here
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('en', 'US'), // English
        const Locale('es', 'ES'), // Spanish
      ],
        title: 'Components App',
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        routes: getApplicationRoutes(),
      onGenerateRoute: ( RouteSettings settings ) {

          return MaterialPageRoute(

            builder: (BuildContext context) => AlertPage (),
          );

      },
    );
  }
}
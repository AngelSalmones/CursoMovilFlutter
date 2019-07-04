import 'package:flutter/material.dart';
import 'package:login/src/blocs/products_bloc.dart';


import 'login_bloc.dart';

class Provider extends InheritedWidget {
  final loginbloc = new LoginBloc();
  final _productsBloc = new ProducsBloc();
    static Provider _instance;
    factory Provider ({Key key,Widget child}){
      if (_instance==null){
        _instance=new Provider._internal(key: key ,child: child);
      }

      return _instance;
    }

      Provider._internal({Key key,Widget child})
          : super (key:key ,child :child);


//
//  Provider({Key key,Widget child})
//  : super (key:key ,child :child);

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) {

    return true;
  }

  static LoginBloc  of (BuildContext context){
    return (context.inheritFromWidgetOfExactType(Provider)as Provider).loginbloc;
  }

  static ProducsBloc porductsbloc (BuildContext context){
    return (context.inheritFromWidgetOfExactType(Provider)as Provider)._productsBloc;
  }


}
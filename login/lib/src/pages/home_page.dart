import 'package:flutter/material.dart';
import 'package:login/src/blocs/provider.dart';

class HomePage extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('HOME PAGE'),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
         crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text('Email: ${bloc.email} '),
            Divider(),
            Text('Password:  ${bloc.password}')
          ],
        )
      ),
    );
  }
  
}
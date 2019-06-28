import 'package:flutter/material.dart';

import 'package:components/src/providers/menu_provider.dart';
import 'package:components/src/utils/icon_string_utils.dart';
import 'package:components/src/pages/alert_page.dart';
class HomePage extends StatelessWidget{

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('Components'),
      ),
      body: _list (),
    );
  }

  Widget _list () {

   //menuProvider.laodData().
    return FutureBuilder(
      future: menuProvider.loadData(),
      initialData: [],
      builder: (  context , AsyncSnapshot<List<dynamic>> snapshot){

        return  ListView(
          children: _listitems( snapshot.data, context),
        );
      },
    );

  }

  List <Widget> _listitems(List<dynamic> data , BuildContext context){
    
    final List<Widget> options = [];
    
    data.forEach((opts){
      final widgetTemp = ListTile(
        title : Text (opts['text']),
        leading: getIcon ( opts['icon']),
        trailing: Icon (Icons.arrow_forward_ios, color: Colors.orange,),
        onTap: (){

          Navigator.pushNamed(context, opts['route']);
//          final route = MaterialPageRoute(
//            builder: (context){
//              return AlertPage();
//            }
//          );
//          Navigator.push(context, route);

        },
      );
      options..add( widgetTemp )
             ..add (Divider());
    });

    return options;
  }

}
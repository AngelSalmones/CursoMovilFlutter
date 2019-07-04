import 'package:flutter/material.dart';

class HomePageTemp extends StatelessWidget{
  final options = ['one','two','three','four','five'];

  @override
  Widget build(BuildContext context) {

    return Scaffold (
      appBar: AppBar(
        title:  Text('Components Temp'),
      ),
      body: ListView(
        children: _createitemsshort()
      ),
    );
  }

  List <Widget> _createitems () {

    List<Widget> list = new List <Widget>();

    for (String elements in options){
      final tempWidget = ListTile(
        title : Text ( elements),
      );

      list.add ( tempWidget );
      list.add (Divider());

    }

    return list;
  }
  List<Widget> _createitemsshort (){
    var witgets = options.map( ( item ){


      return Column(
        children: <Widget>[
          ListTile(
            subtitle: Text ('number'),
            title: Text (item),
            leading: Icon(Icons.list),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: (){},
          ),
          Divider (),
        ],
      );
    }).toList();
    return witgets;
  }

}
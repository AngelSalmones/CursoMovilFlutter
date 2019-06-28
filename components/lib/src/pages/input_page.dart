import 'package:flutter/material.dart';

class InputPage extends StatefulWidget {
  @override
  _inputPageState createState () => _inputPageState();

}

class _inputPageState extends State <InputPage>{
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text ('Inputs'),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 10.0,vertical: 20.0),
        children: <Widget>[
          _createInput(),
        ],
      ),
    );
  }

  Widget _createInput () {

    return TextField(
      autofocus: true,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
        counter: Text ('Letters'),
        hintText: 'First Name',
        labelText: 'Name',
        helperText: 'Only is name',
        suffix: Icon(Icons.accessibility),
        icon: Icon(Icons.account_circle),
        
      ),

    );
  }

}
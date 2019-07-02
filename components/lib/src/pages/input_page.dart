import 'package:flutter/material.dart';

class InputPage extends StatefulWidget {
  @override
  _inputPageState createState () => _inputPageState();

}

class _inputPageState extends State <InputPage>{

  String _name="";
  int _lengthname=0;
  String _email="";
  String _date = "";
  String _optionselect = 'fly';

  List<String> _powers = ['fly', 'xray','super strong', 'super fast'];

  TextEditingController _inputFielDateController = new TextEditingController();

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
          Divider(),
          _createemail(),
          Divider(),
          _createpass(),
          Divider(),
          _createdate(context),
          Divider(),
          _cratedropdown(),
          Divider(),
          _createpeople(),
        ],
      ),
    );
  }

  Widget _createInput () {

    return TextField(
      autofocus: true,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius:BorderRadius.circular(20.0),
        ),
        counter: Text ('Letters ${_lengthname}'),
        hintText: 'First Name',
        labelText: 'Name',
        helperText: 'Only is name',
        suffix: Icon(Icons.accessibility),
        icon: Icon(Icons.account_circle),

      ),
      onChanged: (valor) {
        setState(() {
          _name = valor;
          _lengthname = _name.length;
        });
      },

    );
  }
  Widget _createemail () {
    return TextField (
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        hintText: "Your Email",
        labelText: "Email",
        helperText: "only email",
        suffixIcon: Icon (Icons.alternate_email),
        icon: Icon(Icons.mail),
      ),
      onChanged: (valor){
        setState(() {
          _email=valor;
        });
      },
    );
  }

  Widget _createpass() {
    return TextField(
      obscureText: true,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0)
        ),
          hintText: 'Password',
        labelText: 'Password',
        suffixIcon: Icon(Icons.lock_outline),
          icon: Icon(Icons.lock),
      ),
      onChanged: (value){
        setState(() {
          _email=value;
        });
      },
    );
  }

  Widget _createdate (BuildContext context) {
    return TextField(
      enableInteractiveSelection: false,
      controller: _inputFielDateController,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0)
        ),
        hintText: 'birth date',
        labelText: 'birth date',
        suffixIcon: Icon(Icons.perm_contact_calendar),
        icon: Icon(Icons.calendar_today),
      ),
      onTap: (){
        FocusScope.of(context).requestFocus(new FocusNode());
        _selectdate(context);

      },
    );
  }

  _selectdate (BuildContext context) async{

    DateTime picked = await showDatePicker(
        context: context,
        initialDate: new DateTime.now(),
        firstDate: new DateTime(2018),
        lastDate: new DateTime(2025),
        locale: Locale('es','ES'),
    );
    if (picked != null){
      setState(() {
        _date = picked.toString();
        _inputFielDateController.text = _date;
      });
    }
  }

  List<DropdownMenuItem<String>> getOptionsDropdown (){
    List<DropdownMenuItem<String>> list = new List ();
    _powers.forEach((power){
      list.add (DropdownMenuItem(
        child: Text(power),
        value: power,
      ));
    });

    return list;
  }
  _cratedropdown(){
    return Row (
      children: <Widget>[
        Icon(Icons.power_settings_new),
        SizedBox(width: 30.0,),
        Expanded(
          child: DropdownButton(
            value: _optionselect,
           items: getOptionsDropdown(),
           onChanged: (opt){
              setState(() {
                _optionselect = opt;
              });
            },),
        ),
      ],
    );
  }

  Widget _createpeople () {
   return ListTile(
     title: Text('your names is $_name'),
     subtitle: Text('your email is $_email'),
   );
  }



}
import 'package:flutter/material.dart';
import 'package:login/src/blocs/login_bloc.dart';
import 'package:login/src/blocs/provider.dart';
import 'package:login/src/providers/user_provider.dart';

class SignupPage extends StatelessWidget{
  final userProvider = new UserProvider();

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Stack(
        children: <Widget>[
          _crateBackGround(context),
          _loginform(context),
        ],
      ),
    );
  }

  Widget _crateBackGround(BuildContext context){
    final size = MediaQuery.of(context).size;
    final backGroundPurple = Container(
      height: size.height *0.4,
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: <Color> [
            Color.fromRGBO(63, 63, 156, 1.0),
            Color.fromRGBO(90, 70, 178, 1.0),
          ],
        ),
      ),
    );

    final circle = Container(
      width: 100.0,
      height: 100.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100.0),
        color: Color.fromRGBO(255, 225, 255, .08),
      ),
    );

    return Stack(

      children: <Widget>[
        backGroundPurple,
        Positioned(child: circle, top: 90.0, left: 30.0,),
        Positioned(child: circle, top: -40.0, right: -30.0,),
        Positioned(child: circle, bottom: 40.0, left: 30.0,),
        Positioned(child: circle, bottom: 120.0, right: 50.0,),
        Positioned(child: circle, top: 150.0, left: 150.0,),

        Container(
          padding: EdgeInsets.only(top: 30.0),
          child: Column(
            children: <Widget>[
              Icon(Icons.person_pin_circle,color: Colors.white,size: 100,),
              SizedBox(height: 10.0,width: double.infinity,),
              Text ('Angel Salmones',style: TextStyle(color: Colors.white,fontSize: 30.0),),
            ],
          ),
        ),


      ],
    );
  }

  Widget _loginform(BuildContext context){

    final bloc = Provider.of(context);
    final size = MediaQuery.of(context).size;

    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          SafeArea(
            child: Container(
              height: 180.0,
            ),
          ),
          Container(
            width: size.width *0.85 ,
            margin: EdgeInsets.symmetric(vertical: 30.0),
            padding: EdgeInsets.symmetric(vertical: 40.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(5.0),
              boxShadow: <BoxShadow>[
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 3.0,
                  offset: Offset(0.0, 5.0),
                  spreadRadius: 3.0,
                ),
              ],


            ),
            child: Column(
              children: <Widget>[
                Text ('Create Acount',style: TextStyle(fontSize: 20.0),),
                SizedBox(height: 30.0,),
                _createEmail(bloc),
                SizedBox(height: 30.0,),
                _createPass(bloc),
                SizedBox(height: 30.0,),
                _cretebotton(bloc),
              ],
            ),
          ),

          FlatButton(
            child: Text('Login...'),
            onPressed: ()=> Navigator.pushReplacementNamed(context, 'login'),
          ),
          SizedBox(height: 100.0,),
        ],
      ),
    );

  }

  Widget _createEmail (LoginBloc bloc){


    return StreamBuilder(
      stream: bloc.emailStream,
      builder: (BuildContext context, AsyncSnapshot snapshot){
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: TextField(
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              icon: Icon(Icons.alternate_email,color: Colors.deepPurple,),
              hintText: 'Example@mail.com',
              labelText: 'Email',
              errorText: snapshot.error,
            ),
            onChanged: bloc.changeEmail,
          ),
        );

      },
    );


  }

  Widget _createPass (LoginBloc bloc){

    return StreamBuilder(
      stream: bloc.passwordStream,
      builder: (BuildContext context , AsyncSnapshot snapshot){

        return Container(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: TextField(
            obscureText: true,
            decoration: InputDecoration(
              icon: Icon(Icons.lock,color: Colors.deepPurple,),

              labelText: 'Password',
              errorText: snapshot.error,
            ),
            onChanged: bloc.changePassword,
          ),
        );
      },
    );

  }

  Widget _cretebotton (LoginBloc bloc){

    return StreamBuilder(
      stream: bloc.formValidStream,
      builder: (BuildContext context , AsyncSnapshot snapshot){
        return RaisedButton(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 100.0 ,vertical: 15.0),
            child: Text('Login'),
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          elevation: 0.0,
          color: Colors.deepPurple,
          textColor: Colors.white,
          onPressed: snapshot.hasData ? ()=>_register(bloc,context) : null,
        );      },
    );

  }

  _register (LoginBloc bloc, BuildContext context){
    userProvider.newUser(bloc.email, bloc.password);

//    Navigator.pushNamed(context, 'home');

  }

}
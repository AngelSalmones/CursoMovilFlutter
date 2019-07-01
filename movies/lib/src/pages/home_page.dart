import 'package:flutter/material.dart';
import 'package:movies/src/providers/movies_provider.dart';
import 'package:movies/src/widgets/card_swimper.dart';


class HomePage extends StatelessWidget{
  final moviesProvider = new MoviesProvider();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text ('Movies in cinemas'),
        backgroundColor: Colors.indigoAccent,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: (){
            },
          ),
        ],
      ),
      body: Container(
          child: Column(
            children: <Widget>[
              _swipercards(),

            ],
          ),
      ),
    );
  }

  Widget _swipercards() {

    return FutureBuilder(
      future: moviesProvider.getInTheater(),
      builder: (BuildContext context, AsyncSnapshot<List> snapshot){
        if (snapshot.data != null){
          return CardSwiper(
            movies: snapshot.data,
          );
        }else{
          return Container(
            height: 400.0,
              child: Center(
                  child: CircularProgressIndicator()
              )
          );
        }


      },
    );
//    moviesProvider.getInTheater();
//    return CardSwiper (
//      movies : [1,2,3,4,5],
//    );
  }


}
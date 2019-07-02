import 'package:flutter/material.dart';
import 'package:movies/src/providers/movies_provider.dart';
import 'package:movies/src/search/search_delegate.dart';
import 'package:movies/src/widgets/card_swimper.dart';
import 'package:movies/src/widgets/movie_horizontal.dart';


class HomePage extends StatelessWidget{
  final moviesProvider = new MoviesProvider();
  @override
  Widget build(BuildContext context) {

    moviesProvider.getPopular();

    return Scaffold(
      appBar: AppBar(
        title: Text ('Movies in cinemas'),
        backgroundColor: Colors.indigoAccent,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: (){
              showSearch(
                context: context,
                delegate: DataSearch()
              );
            },
          ),
        ],
      ),
      body: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              _swipercards(),
              _footer(context),
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

  Widget _footer(BuildContext context){
    return Container(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(left: 20.0),
              child: Text ('Popular',style: Theme.of(context).textTheme.subhead,)),
          SizedBox(height: 5.0,),
          StreamBuilder(
            stream: moviesProvider.popularStream,
            builder: (BuildContext context , AsyncSnapshot <List> snapshot){
                if (snapshot.hasData){
                  return MovieHorizontal(movies: snapshot.data,nextpage: moviesProvider.getPopular,);
                }else{
                  return Center(child: CircularProgressIndicator());
                }
            },
          ),
        ],
      ),
    );
  }


}
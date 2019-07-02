import 'package:flutter/material.dart';
import 'package:movies/src/models/movie_model.dart';
import 'package:movies/src/providers/movies_provider.dart';


class DataSearch extends SearchDelegate{

  final moviesProvider = new MoviesProvider ();

  final movies = [
    'Capitan America',
    'Vengadores',
    'Batman',
    'Shazam!',
    'Wonder Woman',
    'Hulk',
    'Glass'
  ];

  final recentMovies = [
    'Spiderman',
    'Toy Story',

  ];
  @override
  List<Widget> buildActions(BuildContext context) {
    //the accion of the appbar
    return [
      IconButton(
        icon: Icon (Icons.clear),
        onPressed: (){
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    // TODO: implement buildLeading
    return IconButton(
      icon:  AnimatedIcon(icon: AnimatedIcons.menu_arrow,
        progress: transitionAnimation,
      ),
      onPressed: (){
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    // TODO: implement buildResults
    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {

    if (query.isEmpty){
      return Container();
    }else{
      return FutureBuilder(
         future: moviesProvider.serarcMovie(query),
          builder: (context, AsyncSnapshot <List<Movie>> snapshot ){
           if(snapshot.hasData){
             final movies = snapshot.data;
             return ListView(
               children: movies.map((movie){
                 return ListTile(
                    leading: FadeInImage( image: NetworkImage(movie.getPosterImg()),
                        placeholder: AssetImage('assets/img/loading.gif'),
                      fit: BoxFit.contain,
                    ),
                   title: Text (movie.title),
                   subtitle: Text(movie.originalTitle),
                   onTap: (){
                      close(context, null);
                      Navigator.pushNamed(context, 'detail',arguments: movie);
                   },
                 );
               }).toList()
             );
           }else{
             return Center(
               child: CircularProgressIndicator(),
             );
           }
          },

      );
    }

  }



}
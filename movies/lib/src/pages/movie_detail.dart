import 'package:flutter/material.dart';
import 'package:movies/src/models/actor_model.dart';
import 'package:movies/src/models/movie_model.dart';
import 'package:movies/src/providers/movies_provider.dart';


class MovieDetailPage extends StatelessWidget{


  @override
  Widget build(BuildContext context) {

    final Movie movie = ModalRoute.of(context).settings.arguments;


    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          _createAppbar (movie),
          SliverList(
            delegate: SliverChildListDelegate(
            [
              SizedBox(height: 20.0,),
              _posterTitle(context,movie),
              _description(movie),
              _description(movie),
              _description(movie),
              _description(movie),
              _createcast(movie),


            ]
            ),
          ),
        ],
      ),
    );
  }

  Widget _createAppbar (Movie movie){

    return SliverAppBar(
      elevation: 2.0,
      backgroundColor: Colors.indigoAccent,
      expandedHeight: 200.0,
      floating: false,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        title: Text(
          movie.title,
          style: TextStyle(color: Colors.white,
          fontSize: 16.0
          ),
        ),
        background: FadeInImage(
            placeholder: AssetImage('assets/img/loading.gif'),
            image: NetworkImage(movie.getBackgroundImg()),
          fadeInDuration: Duration(milliseconds: 150),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _posterTitle (BuildContext context,Movie movie){
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: Row(
        children: <Widget>[
          Hero(
            tag: movie.id,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20.0),
              child: Image(
                image: NetworkImage(movie.getPosterImg()),
                height: 150.0,
              ),
            ),
          ),
          SizedBox(width: 20.0,),
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text (movie.title,
                style: Theme.of(context).textTheme.title,overflow: TextOverflow.ellipsis,),
                Text (movie.originalTitle,
                    style: Theme.of(context).textTheme.subhead, overflow: TextOverflow.ellipsis,),
                Row(
                  children: <Widget>[
                    Icon(Icons.star_border),
                    Text(movie.voteAverage.toString(),style: Theme.of(context).textTheme.caption,)
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _description (Movie movie){

    return  Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
      child: Text(
        movie.overview,
        textAlign: TextAlign.justify,
      ),
    );
  }

  Widget _createcast (Movie movie){
    final moviProvider = new MoviesProvider();
    return FutureBuilder(
      future:  moviProvider.getCast(movie.id.toString()),
      builder: (BuildContext context, AsyncSnapshot <List> snapshot){
        if (snapshot.hasData){
          return _createActorsPageView(snapshot.data);
        }else{
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }

  Widget _createActorsPageView(List <Actor> actors){

    return SizedBox(
      height: 200.0,
      child: PageView.builder(
        pageSnapping: false,
          itemCount: actors.length,
        controller: PageController(
          viewportFraction: 0.3,
          initialPage: 1,
        ),
        itemBuilder: (BuildContext context , int i){
            return _actorcard(actors[i]);
        },
      ),
    );

  }
  
  Widget _actorcard (Actor actor ){
    
    return Container(
      child: Column(
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.circular(20.0),
             child :FadeInImage(
               placeholder: AssetImage('assets/img/loading.gif'),
               image: NetworkImage(actor.getPhoto(),),
               height: 130.0,
               fit: BoxFit.cover,
             ),
           ),
          Text(
              actor.name,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }

}
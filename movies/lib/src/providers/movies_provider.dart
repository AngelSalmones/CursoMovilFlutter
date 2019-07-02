import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:movies/src/models/actor_model.dart';

import 'package:movies/src/models/movie_model.dart';
import 'package:http/http.dart' as http;

class MoviesProvider {
  String _apikey = '958a8483ded35b63e0caf53ac8a9aac8';
  String _url = 'api.themoviedb.org';
  String _language = 'es-ES';
  int _popularPage = 0;
  bool _ready  = false;

  List<Movie> _populars = new List();

  final _popularsStreamController = StreamController<List<Movie>>.broadcast();

  Function (List<Movie>) get popularsSink => _popularsStreamController.sink.add;

  Stream <List<Movie>>get popularStream => _popularsStreamController.stream;

  void disposeStream(){
    _popularsStreamController?.close();
  }

  Future<List<Movie>> _createurl (Uri url) async {
    final answer = await http.get(url);
    final decodedData = json.decode(answer.body);
    print (decodedData);
    final movies = new Movies.fromJsonList(decodedData['results']);
    return movies.items;
  }

  Future <List<Movie>> getInTheater () async {
    final url = Uri.https(_url, '3/movie/now_playing', {
      'api_key': _apikey,
      'language': _language,
    });
    return await _createurl(url);
  }

  Future <List<Movie>> getPopular () async{
    if (_ready) return [];
    _ready = true;
    _popularPage++;
    final url = Uri.https(_url, '3/movie/popular',{
      'api_key' : _apikey,
      'language': _language,
      'page'    : _popularPage.toString()
    });

    final answer = await _createurl(url);
    _populars.addAll(answer);
    popularsSink( _populars );
    _ready = false;
    return answer;
  }

  Future <List<Actor>> getCast (String moviid) async{
    final url = Uri.https(_url,'3/movie/$moviid/credits', {
      'api_key' : _apikey,
      'language': _language,
    });

    final answer = await http.get(url);
    final decodeData = jsonDecode(answer.body);
    final cast = new Cast.fromJsonList(decodeData['cast']);

    return cast.actors;
  }

  Future <List<Movie>> serarcMovie (String query) async {
    final url = Uri.https(_url, '3/search/movie', {
      'api_key': _apikey,
      'language': _language,
      'query'   : query,
    });
    return await _createurl(url);
  }

}
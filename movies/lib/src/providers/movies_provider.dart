import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:movies/src/models/movie_model.dart';
import 'package:http/http.dart' as http;

class MoviesProvider {
  String _apikey = '958a8483ded35b63e0caf53ac8a9aac8';
  String _url = 'api.themoviedb.org';
  String _language = 'es-ES';

  Future <List<Movie>> getInTheater () async {
    final url = Uri.https(_url, '/3/movie/now-playing',{
      'api_key'  : _apikey,
      'language' : _language
    });
    final answer = await http.get( url );
    final decodedData = json.decode(answer.body);
    final movies = new Movies.fromJsonList(decodedData['result']);


    return movies.items;
  }

}
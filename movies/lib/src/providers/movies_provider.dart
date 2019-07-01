import 'dart:convert';
import 'package:flutter/material.dart';

import 'package:movies/src/models/movie_model.dart';
import 'package:http/http.dart' as http;

class MoviesProvider {
  String _apikey = '958a8483ded35b63e0caf53ac8a9aac8';
  String _url = 'api.themoviedb.org';
  String _language = 'en-US';
  String _page = "1";

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
    final url = Uri.https(_url, '3/movie/popular',{
      'api_key' : _apikey,
      'language': _language
    });
    return await _createurl(url);
  }

}
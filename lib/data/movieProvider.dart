import 'package:global_configuration/global_configuration.dart';
import 'package:video_streamer/model/movie.dart';
import 'package:video_streamer/model/query.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter/material.dart';

final String pages = "&page=1";

final String popular = 'https://api.themoviedb.org/3/movie/popular';

final String topRated = 'https://api.themoviedb.org/3/movie/top_rated';

final String similar = 'https://api.themoviedb.org/3/movie/429/similar';

/// Singleton instance to retrieve and cache movies.
class MovieProvider {
  MovieProvider._privateConstructor();

  static MovieProvider get instance => _instance;

  static final MovieProvider _instance = MovieProvider._privateConstructor();

  /// File properties initialized and passed in from init.dart.
  GlobalConfiguration cfg;

  // TMDB API Key. Required for querying TMDB service.
  String apiKey;

  // TMDB Base HTTP URL. Required for querying TMDB service.
  String tmdbBaseUrl;

  // Popular movie titles.
  List<Movie> popularMovies;

  // Top rated movie titles.
  List<Movie> topRatedMovies;

  // Top rated spahetti western titles.
  List<Movie> spaghettiMovies;

  // Similar movies to x (have to specify x in the query).
  List<Movie> similarMovies;

  /// Initialize this Singleton instance.
  Future<void> init() async {
    tmdbBaseUrl = cfg.getValue("tmdbBaseUrl");
    apiKey = cfg.getValue("tmdbApiKey");
    print("TMDB Base URL: " + tmdbBaseUrl);
    print("TMDB API Key: " + apiKey);

    print("Initialize the movie catalog.");
    popularMovies = await fetchMovies(url: popular);
    topRatedMovies = await fetchMovies(url: topRated);
    similarMovies = await fetchMovies(url: similar);
  }

  /// Refresh the lists by calling the init() method.
  Future<void> refresh() async {
    this.init();
  }

  /// Remote call to GET a list of movies from the server.
  Future<List<Movie>> fetchMovies({@required url}) async {
    url = url + "?api_key=" + apiKey + pages;
    print("Fetch movies: " + url);
    final response = await http.get(url);

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      var aQuery = Query.fromJson(jsonDecode(response.body));
      List<Movie> movies = aQuery.getList();
      print("Found: " + movies.length.toString());
      processMovies(movies);
      return movies;
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load movies');
    }
  }

  // Post-process any tmdb content retrieved.
  List<Movie> processMovies(List<Movie> movies) {
    for (var item in movies) {
      expandUrls(item);
    }
    return movies;
  }

  // Prepend the tmdb URL to each movie poster path.
  expandUrls(Movie aMovie) {
    String aPath = aMovie.posterPath;
    aMovie.posterPath = tmdbBaseUrl + aPath;

    String backdropPath = aMovie.backdropPath;
    aMovie.backdropPath = tmdbBaseUrl + backdropPath;
  }
}

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

final String recommended = 'https://api.themoviedb.org/3/movie/';

final String banner = 'https://api.themoviedb.org/3/discover/movie';

///discover/movie?sort_by=popularity.desc

/// Singleton instance to retrieve and cache movies.
class MovieProvider extends ChangeNotifier {
  MovieProvider._privateConstructor();

  static MovieProvider get instance => _instance;

  static final MovieProvider _instance = MovieProvider._privateConstructor();

  /// File properties initialized and passed in from init.dart.
  GlobalConfiguration cfg;

  // TMDB API Key. Required for querying TMDB service.
  String apiKey;

  // TMDB Movie Jacket Base HTTP URL. Required for querying TMDB service.
  String tmdbJacketBaseUrl;

// TMDB Movie Banner Base HTTP URL. Required for querying TMDB service.
  String tmdbBannerBaseUrl;

  // Popular movie titles.
  List<Movie> popularMovies;

  // Top rated movie titles.
  List<Movie> topRatedMovies;

  // Top rated spahetti western titles.
  List<Movie> spaghettiMovies;

  // Similar movies to x (have to specify x in the query).
  List<Movie> similarMovies;

  // Movies to be displayed in the lander banner.
  List<Movie> bannerMovies;

  /// Initialize this Singleton instance.
  Future<void> init() async {
    tmdbJacketBaseUrl = cfg.getValue("tmdbJacketBaseUrl");
    tmdbBannerBaseUrl = cfg.getValue("tmdbBannerBaseUrl");
    apiKey = cfg.getValue("tmdbApiKey");

    print("Initialize the movie catalog.");
    popularMovies = await fetchMovies(url: popular);
    topRatedMovies = await fetchMovies(url: topRated);
    similarMovies = await fetchMovies(url: similar);
    bannerMovies = await fetchMovies(url: banner);
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
    List<Movie> list = new List<Movie>();
    for (var item in movies) {
      String aPath = item.posterPath;
      if (aPath == null) {
        continue;
      }
      item.posterPath = tmdbJacketBaseUrl + aPath;

      String backdropPath = item.backdropPath;
      if (backdropPath == null) {
        continue;
      }
      item.backdropPath = tmdbBannerBaseUrl + backdropPath;
      list.add(item);
    }
    return list;
  }

  Future<List<Movie>> getSimilarMovies(Movie aMovie) async {
    int id = aMovie.id;
    String path = recommended + id.toString() + "/similar";
    return await fetchMovies(url: path);
  }
}

// The Watchlist Page.
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:video_streamer/component/jacketList.dart';
import 'package:video_streamer/data/movieProvider.dart';
import 'package:video_streamer/model/movie.dart';
import 'package:video_streamer/pages/pdp.dart';

class LanderPage extends StatefulWidget {
  LanderPage({Key key, this.title}) : super(key: key);
  final String title;
  static final String customAppThemeId = 'custom_theme';

  @override
  _LanderPageState createState() => _LanderPageState();
}

// Stateful widget to display on sale items.
class _LanderPageState extends State<LanderPage> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(0.0),
      children: <Widget>[
        Container(
          child: CarouselSlider(
            options: CarouselOptions(
              viewportFraction: 0.8,
              autoPlay: true,
              autoPlayInterval: Duration(seconds: 3),
              autoPlayCurve: Curves.fastOutSlowIn,
              enlargeCenterPage: true,
              aspectRatio: 2,
            ),
            items: getBannerMovieList().map((i) {
              return Builder(
                builder: (BuildContext context) {
                  return Container(
                      width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.symmetric(horizontal: 0.0),
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(i.backdropPath),
                          fit: BoxFit.fill,
                        ),
                      ),
                      child: GestureDetector(onTap: () {
                        Navigator.of(context).push(_createRoute(i));
                      }));
                },
              );
            }).toList(),
          ),
        ),
        Container(
            padding: EdgeInsets.all(0.0),
            margin: EdgeInsets.only(top: 10.0),
            // 'Recommended for you' list
            child: JacketList(
                movieList: getPopularMovieList(),
                title: 'Recommended for you')),
        Container(
            padding: EdgeInsets.all(0.0),
            margin: EdgeInsets.symmetric(vertical: 0.0),
            // 'New to the app' list
            child: JacketList(
                movieList: getTopRatedMovieList(),
                title: 'New to The <app name goes here>')),
        Container(
            padding: EdgeInsets.all(0.0),
            margin: EdgeInsets.symmetric(vertical: 0.0),
            // 'New to the app' list
            child: JacketList(
                movieList: getSimilarMovieList(),
                title: 'Because you watched')),
      ],
    );
  }

  Route _createRoute(Movie aMovie) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) =>
          ImageScreen(aMovie),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        var begin = Offset(0.0, 1.0);
        var end = Offset.zero;
        var curve = Curves.ease;

        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    );
  }

  List<Movie> getPopularMovieList() {
    List<Movie> movies = MovieProvider.instance.popularMovies;
    if (movies.isEmpty) return <Movie>[];
    return movies;
  }

  List<Movie> getTopRatedMovieList() {
    List<Movie> movies = MovieProvider.instance.topRatedMovies;
    if (movies.isEmpty) return <Movie>[];
    return movies;
  }

  List<Movie> getSpaghettiMovieList() {
    List<Movie> movies = MovieProvider.instance.spaghettiMovies;
    if (movies.isEmpty) return <Movie>[];
    return movies;
  }

  List<Movie> getSimilarMovieList() {
    List<Movie> movies = MovieProvider.instance.similarMovies;
    if (movies.isEmpty) return <Movie>[];
    return movies;
  }

  List<Movie> getBannerMovieList() {
    List<Movie> movies = MovieProvider.instance.bannerMovies;
    if (movies.isEmpty) return <Movie>[];
    return movies;
  }
}

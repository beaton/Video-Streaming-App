// The Watchlist Page.
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:video_streamer/component/jacketList.dart';
import 'package:video_streamer/data/movieProvider.dart';
import 'package:video_streamer/model/movie.dart';

class LanderPage extends StatefulWidget {
  LanderPage({Key key, this.title}) : super(key: key);
  final String title;
  static final String customAppThemeId = 'custom_theme';

  @override
  _LanderPageState createState() => _LanderPageState();
}

// Stateful widget to display on sale items.
class _LanderPageState extends State<LanderPage> {
  final List<String> bannerList = [
    'https://image.tmdb.org/t/p/w500/zhCu4iJHSKBf4uAIQyaR5IQ5nhi.jpg',
    'https://image.tmdb.org/t/p/w500/ulSuhpY9iHXp2fz0ixMGhbTrZCM.jpg'
  ];

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
            items: bannerList.map((i) {
              return Builder(
                builder: (BuildContext context) {
                  return Container(
                      width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.symmetric(horizontal: 0.0),
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(i),
                          fit: BoxFit.fill,
                        ),
                      ));
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

  List<Movie> getPopularMovieList() {
    List<Movie> movies = MovieProvider.instance.popularMovies;
    return movies;
  }

  List<Movie> getTopRatedMovieList() {
    List<Movie> movies = MovieProvider.instance.topRatedMovies;
    return movies;
  }

  List<Movie> getSpaghettiMovieList() {
    List<Movie> movies = MovieProvider.instance.spaghettiMovies;
    return movies;
  }

  List<Movie> getSimilarMovieList() {
    List<Movie> movies = MovieProvider.instance.similarMovies;
    return movies;
  }
}

import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:video_streamer/component/jacketList.dart';
import 'package:video_streamer/data/movieProvider.dart';
import 'package:video_streamer/model/movie.dart';

final List<String> bannerList = [
  'https://image.tmdb.org/t/p/w500/zhCu4iJHSKBf4uAIQyaR5IQ5nhi.jpg',
  'https://image.tmdb.org/t/p/w500/ulSuhpY9iHXp2fz0ixMGhbTrZCM.jpg'
];

/// The Movies Page.
class HomePage extends StatelessWidget {
  static final String customAppThemeId = 'custom_theme';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("The App")),
      body: ListView(
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
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search_outlined),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.download_outlined),
            label: 'Download',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings_outlined),
            label: 'Settings',
          ),
        ],
        currentIndex: 0,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
        //onTap: _onItemTapped,
      ),
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

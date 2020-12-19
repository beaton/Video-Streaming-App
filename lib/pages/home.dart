import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:video_streamer/component/jacketList.dart';
import 'package:video_streamer/data/movieDataProvider.dart';
import 'package:video_streamer/model/movie.dart';

final List<String> bannerList = [
  'https://image.tmdb.org/t/p/w500/zhCu4iJHSKBf4uAIQyaR5IQ5nhi.jpg',
  'https://image.tmdb.org/t/p/w500/ulSuhpY9iHXp2fz0ixMGhbTrZCM.jpg'
];

/// The Movies Page.
class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Welcome to Flutter',
        home: Scaffold(
          appBar: AppBar(
            title: Text('xyz'),
          ),
          body: ListView(
            padding: const EdgeInsets.all(8),
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
                            margin: EdgeInsets.symmetric(horizontal: 5.0),
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
                  // 'Recommended for you' list
                  child: JacketList(
                      movieList: getPopularMovieList(),
                      title: 'Recommended for you')),
              Container(
                  // 'New to the app' list
                  child: JacketList(
                      movieList: getTopRatedMovieList(), title: 'New to xyz')),
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
        ));
  }

  List<Movie> getPopularMovieList() {
    List<Movie> movies = MovieDataProvider.instance.popularMovies;
    return movies;
  }

  List<Movie> getTopRatedMovieList() {
    List<Movie> movies = MovieDataProvider.instance.topRatedMovies;
    return movies;
  }

  List<Movie> getSpaghettiMovieList() {
    List<Movie> movies = MovieDataProvider.instance.spaghettiMovies;
    return movies;
  }
}

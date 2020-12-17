import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:video_streamer/component/jacketList.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:video_streamer/model/query.dart';

final List<String> bannerList = [
  'https://image.tmdb.org/t/p/w500/zhCu4iJHSKBf4uAIQyaR5IQ5nhi.jpg',
  'https://image.tmdb.org/t/p/w500/ulSuhpY9iHXp2fz0ixMGhbTrZCM.jpg'
];

final List<String> imgList = [
  'https://image.tmdb.org/t/p/w500/bX2xnavhMYjWDoZp1VM6VnU1xwe.jpg',
  'https://image.tmdb.org/t/p/w500/z8oFivRYLYsJtLmhSHhsfsh78gg.jpg',
  'https://image.tmdb.org/t/p/w500/cDe4DcRmUdIBEuYLOJSzfsxgkMw.jpg',
  'https://image.tmdb.org/t/p/w500/eMLf3eV0ZBXOKhQedJpg41KrqAH.jpg',
  'https://image.tmdb.org/t/p/w500/qlLetbOS8cyS936I921y50PIpFx.jpg',
  'https://image.tmdb.org/t/p/w500/oGLFi7D8PlPYKXzbPtp8qCseJFn.jpg',
  'https://image.tmdb.org/t/p/w500/kuW0c9bdxjeQ52O5AzXmR3LVRbZ.jpg'
];

final String popular =
    'https://api.themoviedb.org/3/movie/popular?api_key=<tmdb_api_key>&language=en-US&page=1';

final String topRated =
    'https://api.themoviedb.org/3/movie/top_rated?api_key=<tmdb_api_key>&language=en-US&page=1';

final Future<Query> popularMovies = fetchMovies(url: popular);
final Future<Query> topRatedMoves = fetchMovies(url: topRated);

/// The Movies Page.
class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
      padding: const EdgeInsets.all(8),
      children: <Widget>[
        Container(
          child: CarouselSlider(
            //items: imageSliders,
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
            child: JacketList(imgList: imgList, title: 'Recommended for you')),
        Container(
            // 'New to the app' list
            child: JacketList(imgList: imgList, title: 'New to xyz')),
        Container(
            // 'Continue watching' list
            child: JacketList(imgList: imgList, title: 'Continue Watching')),
        Container(
            // 'Because You Watched' list
            child: JacketList(imgList: imgList, title: 'Because You Watched')),
      ],
    ));
  }
}

/// Remote call to GET a list of movies from the server.
Future<Query> fetchMovies({@required url}) async {
  final response = await http.get(url);

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return Query.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}

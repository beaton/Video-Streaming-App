import 'package:flutter/material.dart';
import 'package:video_streamer/model/movie.dart';

class ImageScreen extends StatefulWidget {
  final Movie movie;
  ImageScreen(this.movie);

  @override
  _MyImageScreen createState() => _MyImageScreen(movie);
}

class _MyImageScreen extends State<ImageScreen> {
  final Movie movie;
  _MyImageScreen(this.movie);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Product Detail Page'),
        ),
        body: Container(
            padding: EdgeInsets.all(5),
            child: Column(children: [
              Image.network(movie.backdropPath, width: double.infinity),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    movie.title,
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w400,
                      fontFamily: 'Roboto',
                      letterSpacing: 0.5,
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Release date',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w400,
                      fontFamily: 'Roboto',
                      letterSpacing: 0.5,
                      fontSize: 15,
                    ),
                  ),
                  Text(
                    movie.releaseDate,
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w400,
                      fontFamily: 'Roboto',
                      letterSpacing: 0.5,
                      fontSize: 15,
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Popularity',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w400,
                      fontFamily: 'Roboto',
                      letterSpacing: 0.5,
                      fontSize: 15,
                    ),
                  ),
                  Text(
                    movie.popularity.toString(),
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w400,
                      fontFamily: 'Roboto',
                      letterSpacing: 0.5,
                      fontSize: 15,
                    ),
                  ),
                ],
              ),
              Row(
                ///mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    movie.voteCount.toString() + ' Reviews',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w400,
                      fontFamily: 'Roboto',
                      letterSpacing: 0.5,
                      fontSize: 15,
                    ),
                  ),
                  stars,
                ],
              )
            ])));
  }
}

var stars = Row(
  mainAxisSize: MainAxisSize.min,
  children: [
    Icon(Icons.star, color: Colors.blue[500]),
    Icon(Icons.star, color: Colors.blue[500]),
    Icon(Icons.star, color: Colors.blue[500]),
    Icon(Icons.star, color: Colors.black),
    Icon(Icons.star, color: Colors.black),
  ],
);

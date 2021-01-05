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
            padding: EdgeInsets.all(6),
            child: Column(children: [
              Image.network(movie.backdropPath, width: double.infinity),
              Padding(
                padding: EdgeInsets.all(0.0),
              ),
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
                  getStars(movie),
                ],
              ),
              Padding(
                padding: EdgeInsets.all(5.0),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  getButton(),
                ],
              ),
              Padding(
                padding: EdgeInsets.all(5),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Release date',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w300,
                      fontFamily: 'Roboto',
                      letterSpacing: 0.0,
                      fontSize: 15,
                    ),
                  ),
                  Text(
                    movie.releaseDate,
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w300,
                      fontFamily: 'Roboto',
                      letterSpacing: 0.0,
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
                      fontWeight: FontWeight.w300,
                      fontFamily: 'Roboto',
                      letterSpacing: 0.0,
                      fontSize: 15,
                    ),
                  ),
                  Text(
                    movie.popularity.toString(),
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w300,
                      fontFamily: 'Roboto',
                      letterSpacing: 0.0,
                      fontSize: 15,
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    movie.voteCount.toString() + ' Reviews',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w300,
                      fontFamily: 'Roboto',
                      letterSpacing: 0.0,
                      fontSize: 15,
                    ),
                  ),
                  Text(
                    movie.voteAverage.toString() + '/10',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w300,
                      fontFamily: 'Roboto',
                      letterSpacing: 0.0,
                      fontSize: 15,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.all(5.0),
              ),
              Row(
                ///mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[Flexible(child: new Text(movie.overview))],
              )
            ])));
  }

  Row getStars(Movie aMovie) {
    List<Icon> stars = new List(5);
    double rating = aMovie.voteAverage / 2;
    for (var i = 0; i < stars.length; i++) {
      if (rating <= i) {
        stars[i] = Icon(Icons.star, color: Colors.grey[300]);
      } else {
        stars[i] = Icon(Icons.star, color: Colors.green[500]);
      }
    }

    var starsRow = Row(
      mainAxisSize: MainAxisSize.min,
      children: stars,
    );

    return starsRow;
  }
}

/// Play button
OutlineButton getButton() {
  return OutlineButton(
    onPressed: () => null,
    child: Stack(
      children: <Widget>[
        Align(
            alignment: Alignment.centerLeft,
            child: Icon(
              Icons.play_arrow_outlined,
              size: 40.0,
            )),
      ],
    ),
    highlightedBorderColor: Colors.orange,
    color: Colors.green,
    borderSide: new BorderSide(color: Colors.black),
    shape: CircleBorder(),
  );
  //shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(5.0)));
}

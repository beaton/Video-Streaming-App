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
        body: Image.network(movie.backdropPath, width: double.infinity));
  }
}

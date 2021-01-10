import 'package:flutter/material.dart';
import 'package:video_streamer/data/movieProvider.dart';
import 'package:video_streamer/model/movie.dart';
import 'package:video_streamer/pages/pdp.dart';

// Suggested or recommended list of videos that are related
// to the video currently being viewed.
class SuggestedList extends StatefulWidget {
  SuggestedList({Key key, @required this.movie}) : super(key: key);
  final Movie movie;

  @override
  _SuggestedList createState() => _SuggestedList();
}

class _SuggestedList extends State<SuggestedList> {
  // imgList is a list of image urls, set from the constructor.
  List<Movie> movieList;

  @override
  void initState() {
    super.initState();
    getSimilarMovieList(widget.movie);
  }

  @override
  Widget build(BuildContext context) {
    return ListView(padding: const EdgeInsets.all(0.0), children: <Widget>[
      /// Vertical parent widget container...
      Container(
          padding: EdgeInsets.all(0.0),
          margin: EdgeInsets.symmetric(vertical: 0.0),
          height: 300,
          child: GridView.builder(
              itemCount: movieList.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                childAspectRatio: 3.0 / 4.0,
                crossAxisCount: 2,
              ),
              itemBuilder: (BuildContext context, int index) {
                final movie = movieList[index];
                return Padding(
                    padding: EdgeInsets.all(5),
                    child: Card(
                        semanticContainer: true,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        clipBehavior: Clip.antiAlias,
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Expanded(
                                  child: Container(
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                          image: NetworkImage(movie.posterPath),
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                      child: GestureDetector(onTap: () {
                                        Navigator.push<Widget>(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                ImageScreen(movie),
                                          ),
                                        );
                                      })))
                            ])));
              }))
    ]);
  }

  Future getSimilarMovieList(Movie aMovie) async {
    List<Movie> movies = await MovieProvider.instance.getSimilarMovies(aMovie);
    // call setState here to set the actual list of items and rebuild the widget.
    setState(() {
      movieList = movies;
    });
  }
}

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
  Future<List<Movie>> _movieList;

  @override
  void initState() {
    super.initState();
    getSimilarMovieList();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(0.0),
        margin: EdgeInsets.symmetric(vertical: 0.0),
        child: FutureBuilder<List<Movie>>(
            future:
                _movieList, // a previously-obtained Future<List<Movie>> or null
            builder:
                (BuildContext context, AsyncSnapshot<List<Movie>> snapshot) {
              List<Widget> children;
              List<Movie> movies = snapshot.data ?? [];
              if (snapshot.hasData) {
                children = <Widget>[
                  Container(
                      padding: EdgeInsets.all(0.0),
                      margin: EdgeInsets.symmetric(vertical: 0.0),
                      height: 240,
                      child: GridView.builder(
                          //physics: NeverScrollableScrollPhysics(),
                          itemCount: movies.length,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            childAspectRatio: 3.0 / 4.0,
                            crossAxisCount: 2,
                          ),
                          itemBuilder: (BuildContext context, int index) {
                            final movie = movies[index];
                            return Padding(
                                padding: EdgeInsets.all(5),
                                child: Card(
                                    semanticContainer: true,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    clipBehavior: Clip.antiAlias,
                                    child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Expanded(
                                              child: Container(
                                                  decoration: BoxDecoration(
                                                    image: DecorationImage(
                                                      image: NetworkImage(
                                                          movie.posterPath),
                                                      fit: BoxFit.fill,
                                                    ),
                                                  ),
                                                  child: GestureDetector(
                                                      onTap: () {
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
                ];
              } else if (snapshot.hasError) {
                children = <Widget>[
                  Icon(
                    Icons.error_outline,
                    color: Colors.red,
                    size: 60,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 16),
                    child: Text('Error: ${snapshot.error}'),
                  )
                ];
              } else {
                children = <Widget>[
                  SizedBox(
                    child: CircularProgressIndicator(),
                    width: 60,
                    height: 60,
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 16),
                    child: Text('Loading...'),
                  )
                ];
              }
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: children,
                ),
              );
            }));
  }

  // GET a list of movies that are similar (recommended) to the one being displayed in the PDP screen.
  Future<List<Movie>> getSimilarMovieList() async {
    Future<List<Movie>> list =
        MovieProvider.instance.getSimilarMovies(widget.movie);
    // call setState here to set the actual list of items and rebuild the widget.
    setState(() {
      _movieList = list;
    });
    return list;
  }
}

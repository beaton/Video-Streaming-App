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
    movieList = getSimilarMovieList(widget.movie);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(padding: const EdgeInsets.all(0.0), children: <Widget>[
      /// Vertical parent widget container...
      Container(
        padding: EdgeInsets.all(0.0),
        margin: EdgeInsets.symmetric(vertical: 0.0),
        height: 150,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          // Let the ListView know how many items it needs to build.
          itemCount: movieList.length,
          // Provide a builder function. This is where the magic happens.
          // Iterate through the imgList and display the imageUrl in the ListView.
          itemBuilder: (context, index) {
            final movie = movieList[index];

            // Individual movie jacket container.
            return Container(
                margin: const EdgeInsets.symmetric(horizontal: 3.0),
                width: 100.0,
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
                      builder: (context) => ImageScreen(movie),
                    ),
                  );
                }));
          },
        ),
      ),
      Container(
          margin: EdgeInsets.symmetric(vertical: 0.0),
          padding: EdgeInsets.all(0.0),
          height: 180.0,
          child: GridView.builder(
            itemCount: 6,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              childAspectRatio: 8.0 / 10.0,
              crossAxisCount: 2,
            ),
            itemBuilder: (BuildContext context, int index) {
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
                                  image: AssetImage('assets/images/happy.png'),
                                  fit: BoxFit.fill),
                            ),
                          )),
                          Padding(
                              padding: EdgeInsets.all(10.0),
                              child: Text(
                                "Name",
                                style: TextStyle(fontSize: 18.0),
                              )),
                        ],
                      )));
            },
          ))
    ]);
  }

  List<Movie> getSimilarMovieList(movie) {
    List<Movie> movies = MovieProvider.instance.similarMovies;
    return movies;
  }
}

import 'package:flutter/material.dart';
import 'package:video_streamer/model/movie.dart';
import 'package:video_streamer/pages/pdp.dart';

class JacketList extends StatelessWidget {
  // imgList is a list of image urls, set from the constructor.
  final List<Movie> movieList;

  // title is the title of this slider list, set from the constructor.
  final String title;

  // In the constructor, require an image list and a title.
  JacketList({Key key, @required this.movieList, @required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    /// Vertical parent widget container...
    return Container(
        margin: EdgeInsets.symmetric(vertical: 0.0),
        padding: EdgeInsets.all(0.0),
        height: 180.0,

        /// Vertical column within the parent container...
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              /// Slider header container...
              SizedBox(
                width: double.infinity,
                child: Padding(
                  padding: EdgeInsets.fromLTRB(7, 0, 0, 2),
                  child: Text(
                    title,
                    style: TextStyle(
                      wordSpacing: 1,
                      color: Colors.black87,
                      fontWeight: FontWeight.w400,
                      fontFamily: 'Roboto',
                      letterSpacing: 0.0,
                      fontSize: 15,
                    ),
                  ),
                ),
              ),

              /// Movie jacket ListView Container...
              Container(
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
                              builder: (context) =>
                                  ImageScreen(movie.posterPath),
                            ),
                          );
                        }));
                  },
                ),
              )
            ]));
  }
}

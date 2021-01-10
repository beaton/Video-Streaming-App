import 'package:flutter/material.dart';
import 'package:video_streamer/model/movie.dart';

class SuggestedList extends StatelessWidget {
  // imgList is a list of image urls, set from the constructor.
  final List<Movie> movieList;

  // In the constructor, require an image list and a title.
  SuggestedList({Key key, @required this.movieList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    /// Vertical parent widget container...
    return Container(
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
                                image: AssetImage('assets/no_image.png'),
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
        ));
  }
}

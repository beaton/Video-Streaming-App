import 'package:flutter/material.dart';
import 'package:video_streamer/model/movie.dart';

class ImageScreen extends StatefulWidget {
  final Movie movie;
  ImageScreen(this.movie);

  @override
  _MyImageScreen createState() => _MyImageScreen(movie);
}

class _MyImageScreen extends State<ImageScreen> {
  TabController _tabController;
  final List<Tab> tabs = <Tab>[
    Tab(text: 'SUGGESTED'),
    Tab(text: 'EXTRAS'),
    Tab(text: 'DETAILS'),
  ];

  final Movie movie;
  _MyImageScreen(this.movie);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Product Detail Page'),
        ),
        body: Container(
            padding: EdgeInsets.all(10),
            child: Column(children: [
              Image.network(movie.backdropPath, width: double.infinity),
              Padding(
                padding: EdgeInsets.all(10.0),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  getButton(context),
                ],
              ),
              Padding(
                padding: EdgeInsets.all(10),
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
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
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
                  Text(
                    " ",
                    style: TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.w300,
                      fontFamily: 'Roboto',
                      letterSpacing: 0.0,
                      fontSize: 15,
                    ),
                  ),
                  Container(
                      height: 5.0,
                      width: 5.0,
                      decoration: new BoxDecoration(
                        color: Colors.grey,
                        shape: BoxShape.circle,
                      )),
                  Text(
                    " ",
                    style: TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.w300,
                      fontFamily: 'Roboto',
                      letterSpacing: 0.0,
                      fontSize: 15,
                    ),
                  ),
                  Text(
                    movie.adult ? 'Adult' : 'Family',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w300,
                      fontFamily: 'Roboto',
                      letterSpacing: 0.0,
                      fontSize: 15,
                    ),
                  ),
                  Text(
                    " ",
                    style: TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.w300,
                      fontFamily: 'Roboto',
                      letterSpacing: 0.0,
                      fontSize: 15,
                    ),
                  ),
                  Container(
                      height: 5.0,
                      width: 5.0,
                      decoration: new BoxDecoration(
                        color: Colors.grey,
                        shape: BoxShape.circle,
                      )),
                  Text(
                    " ",
                    style: TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.w300,
                      fontFamily: 'Roboto',
                      letterSpacing: 0.0,
                      fontSize: 15,
                    ),
                  ),
                  Text(
                    'Fantasy',
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
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'HD',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w300,
                      fontFamily: 'Roboto',
                      letterSpacing: 0.0,
                      fontSize: 15,
                    ),
                  ),
                  Text(
                    " ",
                    style: TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.w300,
                      fontFamily: 'Roboto',
                      letterSpacing: 0.0,
                      fontSize: 15,
                    ),
                  ),
                  Container(
                      height: 5.0,
                      width: 5.0,
                      decoration: new BoxDecoration(
                        color: Colors.grey,
                        shape: BoxShape.circle,
                      )),
                  Text(
                    " 5.1",
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
                mainAxisAlignment: MainAxisAlignment.start,
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
                    " ",
                    style: TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.w300,
                      fontFamily: 'Roboto',
                      letterSpacing: 0.0,
                      fontSize: 15,
                    ),
                  ),
                  Container(
                      height: 5.0,
                      width: 5.0,
                      decoration: new BoxDecoration(
                        color: Colors.grey,
                        shape: BoxShape.circle,
                      )),
                  Text(
                    " ",
                    style: TextStyle(
                      color: Colors.grey,
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
              ),
              Padding(
                padding: EdgeInsets.all(5.0),
              ),
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    SizedBox(
                        width: MediaQuery.of(context).size.width * 0.95,
                        child: DefaultTabController(
                          length: tabs.length,
                          // The Builder widget is used to have a different BuildContext to access
                          // closest DefaultTabController.
                          child: Builder(builder: (BuildContext context) {
                            final TabController tabController =
                                DefaultTabController.of(context);
                            tabController.addListener(() {
                              if (!tabController.indexIsChanging) {
                                // Your code goes here.
                                // To get index of current tab use tabController.index
                              }
                            });
                            return TabBar(
                              unselectedLabelColor: Colors.black,
                              indicatorColor: Colors.black,
                              labelColor: Colors.black,
                              tabs: tabs,
                            );
                          }),
                        ))
                  ])
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
SizedBox getButton(BuildContext context) {
  return SizedBox(
      width: MediaQuery.of(context).size.width * 0.90,
      child: RaisedButton(
          color: Colors.grey,
          splashColor: Colors.grey[200],
          onPressed: () {},
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
          highlightElevation: 0,
          child: Padding(
              padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      'Watch Now',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w400,
                        fontFamily: 'Roboto',
                        letterSpacing: 1.0,
                        fontSize: 20,
                      ),
                    ),
                    Icon(
                      Icons.play_arrow_sharp,
                      color: Colors.white,
                    ),
                  ]))));

  //   RaisedButton(
  //       shape:
  //           RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
  //       onPressed: () => null,
  //       textColor: Colors.white,
  //       color: Colors.blue,
  //       child: Stack(
  //         children: <Widget>[
  //           Align(
  //               alignment: Alignment.center,
  //               child: Icon(
  //                 Icons.play_arrow_outlined,
  //                 size: 40.0,
  //               )),
  //         ],
  //       )),
  // );
  //shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(5.0)));
}

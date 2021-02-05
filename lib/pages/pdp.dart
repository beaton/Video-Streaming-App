import 'package:flutter/material.dart';
import 'package:video_streamer/component/suggested.dart';
import 'package:video_streamer/model/movie.dart';

class ImageScreen extends StatefulWidget {
  final Movie movie;
  ImageScreen(this.movie);

  @override
  _MyImageScreen createState() => _MyImageScreen(movie);
}

class _MyImageScreen extends State<ImageScreen>
    with SingleTickerProviderStateMixin {
  // _MyImageScreen constructor.
  _MyImageScreen(this.movie);

  // Product Detail Page (PDP) is for this movie.
  final Movie movie;

  // Controller for the 'suggested | extras | details' tab view.
  TabController _tabController;
  final List<Tab> tabs = <Tab>[
    Tab(text: 'SUGGESTED'),
    Tab(text: 'EXTRAS'),
    Tab(text: 'DETAILS'),
  ];

  @override
  void initState() {
    _tabController = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Product Detail Page'),
        ),
        body: SingleChildScrollView(
            padding: EdgeInsets.all(10),
            child: Column(children: [
              Image.network(movie.backdropPath),
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
                    truncateWithEllipsis(movie.title, 30),
                    softWrap: false,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      //color: Colors.white,
                      fontWeight: FontWeight.w400,
                      fontFamily: 'Roboto',
                      letterSpacing: 0.5,
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.all(5.0),
              ),
              Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                getStars(movie),
              ]),
              Padding(
                padding: EdgeInsets.all(5.0),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    movie.releaseDate,
                    style: TextStyle(
                      //color: Colors.white,
                      fontWeight: FontWeight.w300,
                      fontFamily: 'Roboto',
                      letterSpacing: 0.0,
                      fontSize: 15,
                    ),
                  ),
                  Text(
                    " ",
                    style: TextStyle(
                      //color: Colors.white,
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
                      //color: Colors.white,
                      fontWeight: FontWeight.w300,
                      fontFamily: 'Roboto',
                      letterSpacing: 0.0,
                      fontSize: 15,
                    ),
                  ),
                  Text(
                    movie.adult ? 'Adult' : 'Family',
                    style: TextStyle(
                      //color: Colors.white,
                      fontWeight: FontWeight.w300,
                      fontFamily: 'Roboto',
                      letterSpacing: 0.0,
                      fontSize: 15,
                    ),
                  ),
                  Text(
                    " ",
                    style: TextStyle(
                      //color: Colors.white,
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
                      //color: Colors.white,
                      fontWeight: FontWeight.w300,
                      fontFamily: 'Roboto',
                      letterSpacing: 0.0,
                      fontSize: 15,
                    ),
                  ),
                  Text(
                    'Fantasy',
                    style: TextStyle(
                      //color: Colors.white,
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
                      //color: Colors.white,
                      fontWeight: FontWeight.w300,
                      fontFamily: 'Roboto',
                      letterSpacing: 0.0,
                      fontSize: 15,
                    ),
                  ),
                  Text(
                    " ",
                    style: TextStyle(
                      //color: Colors.white,
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
                      //color: Colors.white,
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
                      //color: Colors.white,
                      fontWeight: FontWeight.w300,
                      fontFamily: 'Roboto',
                      letterSpacing: 0.0,
                      fontSize: 15,
                    ),
                  ),
                  Text(
                    " ",
                    style: TextStyle(
                      //color: Colors.white,
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
                      //color: Colors.white,
                      fontWeight: FontWeight.w300,
                      fontFamily: 'Roboto',
                      letterSpacing: 0.0,
                      fontSize: 15,
                    ),
                  ),
                  Text(
                    movie.voteAverage.toString() + '/10',
                    style: TextStyle(
                      //color: Colors.white,
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
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                        // Need to state tabView height!
                        height: tabs.length * 100.toDouble(),

                        // TabView width
                        width: MediaQuery.of(context).size.width * 0.90,
                        // margin: EdgeInsets.symmetric(horizontal: 0.0),
                        child: DefaultTabController(
                          length: tabs.length,

                          // The Builder widget is used to have a different BuildContext to access
                          // closest DefaultTabController.
                          child: Builder(builder: (BuildContext context) {
                            final TabController tabController =
                                DefaultTabController.of(context);
                            tabController.addListener(() {
                              if (!tabController.indexIsChanging) {
                                var currentTab = tabController.index;
                                print("Current Tab: " + currentTab.toString());

                                // Your code goes here.
                                // To get index of current tab use tabController.index
                              }
                            });
                            return Expanded(
                                child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                  TabBar(
                                    isScrollable: true,
                                    //unselectedLabelColor: Colors.grey,
                                    //indicatorColor: Colors.white,
                                    //labelColor: Colors.white,
                                    //labelStyle: TextStyle(fontSize: 12.0),
                                    tabs: tabs,
                                    controller: _tabController,
                                  ),
                                  // NOTE: TabBarView requires height to be defined in order to render.
                                  Expanded(
                                    child: TabBarView(
                                      // What to display in the tabViews
                                      children: getTabViewContent(),
                                      controller: _tabController,
                                    ),
                                  ),
                                ]));
                          }),
                        ))
                  ])
            ])));
  }

  Row getStars(Movie aMovie) {
    int length = 5;
    Icon star = new Icon(Icons.star);
    List<Icon> stars = List<Icon>.filled(length, star, growable: false);
    double rating = aMovie.voteAverage / 2;
    for (var i = 0; i < stars.length; i++) {
      if (rating <= i) {
        stars[i] = Icon(Icons.star, color: Colors.grey);
      } else {
        stars[i] = Icon(Icons.star, color: Colors.black);
      }
    }
    var starsRow = Row(
      mainAxisSize: MainAxisSize.min,
      children: stars,
    );

    return starsRow;
  }

  // Return a list of tabBarViews.
  List<Tab> getTabViewContent() {
    List<Tab> tabList = new List<Tab>.empty(growable: true);
    tabList.add(new Tab(child: SuggestedList(movie: movie)));
    tabList.add(new Tab(child: Text('Extras')));
    tabList.add(new Tab(child: Text('Details')));
    return tabList;
  }
}

String truncateWithEllipsis(String aString, double cutoff) {
  return (aString.length <= cutoff)
      ? aString
      : '${aString.substring(0, cutoff.toInt())}...';
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
}

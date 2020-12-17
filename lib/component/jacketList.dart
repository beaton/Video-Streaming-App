import 'package:flutter/material.dart';
import 'package:video_streamer/pages/pdp.dart';

class JacketList extends StatelessWidget {
  // imgList is a list of image urls, set from the constructor.
  final List<String> imgList;

  // title is the title of this slider list, set from the constructor.
  final String title;

  // In the constructor, require an image list and a title.
  JacketList({Key key, @required this.imgList, @required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    /// Vertical parent widget container...
    return Container(
        margin: EdgeInsets.symmetric(vertical: 20.0),
        height: 180.0,

        /// Vertical column within the parent container...
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              /// Slider header container...
              SizedBox(
                width: double.infinity,
                child: Padding(
                  padding: EdgeInsets.fromLTRB(7, 0, 0, 2),
                  child: Text(
                    title,
                    style: TextStyle(
                      color: Colors.blueGrey,
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
                  itemCount: imgList.length,
                  // Provide a builder function. This is where the magic happens.
                  // Iterate through the imgList and display the imageUrl in the ListView.
                  itemBuilder: (context, index) {
                    final imageUrl = imgList[index];

                    // Individual movie jacket container.
                    return Container(
                        margin: const EdgeInsets.symmetric(horizontal: 3.0),
                        width: 100.0,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage(imageUrl),
                            fit: BoxFit.fill,
                          ),
                        ),
                        child: GestureDetector(onTap: () {
                          Navigator.push<Widget>(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ImageScreen(imageUrl),
                            ),
                          );
                        }));
                  },
                ),
              )
            ]));
  }
}

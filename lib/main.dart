import 'package:flutter/material.dart';
import 'package:video_streamer/init.dart';
import 'package:video_streamer/pages/home.dart';
import 'package:video_streamer/splash_screen.dart';

//void main() => runApp(AvodApp());

/// This is the main execution method for the application.
/// Running main() will start-up the application.
void main() {
  print("Starting application.");
  WidgetsFlutterBinding.ensureInitialized();
  runApp(AvodApp());
}

/// This is the class that is first envoked by the main method.
/// Much development in Flutter is done through UI Widgets, here
/// the build method initializes the application while presenting
/// a splashscreen to the user. Once the background initialization
/// (see init.dart) is complete, the HomePage (see home.dart) will
/// be displayed.
///
/// MaterialApp is an out of the box application template that reduces
/// the amount of code required to get up and running with a common look
/// and feel.
///
/// See FutureBuilder for how this works asynchronously.
class AvodApp extends StatelessWidget {
  final Future _initFuture = Init.initialize();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Initialization',
      home: FutureBuilder(
        future: _initFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return HomePage();
          } else {
            return SplashScreen();
          }
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:video_streamer/init.dart';
import 'package:video_streamer/pages/home.dart';
import 'package:video_streamer/splash_screen.dart';

//void main() => runApp(AvodApp());

void main() {
  print("Starting application.");
  WidgetsFlutterBinding.ensureInitialized();
  runApp(AvodApp());
}

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

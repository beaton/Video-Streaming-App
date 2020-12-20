import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:theme_provider/theme_provider.dart';
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
    return ThemeProvider(
        saveThemesOnChange: true,
        loadThemeOnInit: false,
        onInitCallback: (controller, previouslySavedThemeFuture) async {
          String savedTheme = await previouslySavedThemeFuture;
          if (savedTheme != null) {
            controller.setTheme(savedTheme);
          } else {
            Brightness platformBrightness =
                SchedulerBinding.instance.window.platformBrightness;
            if (platformBrightness == Brightness.dark) {
              controller.setTheme('dark');
            } else {
              controller.setTheme('custom_theme');
            }
            controller.forgetSavedTheme();
          }
        },
        themes: <AppTheme>[
          AppTheme.light(id: 'light'),
          AppTheme.dark(id: 'dark'),
          AppTheme(
            description: "custom theme",
            id: "custom_theme", // Id(or name) of the theme(Has to be unique)
            data: ThemeData(
              // Real theme data
              primaryColor: Colors.white,
              accentColor: Colors.red,
            ),
          ),
        ],
        child: ThemeConsumer(
            child: Builder(
                builder: (themeContext) => MaterialApp(
                      title: 'Initialization',
                      theme: ThemeProvider.themeOf(themeContext).data,
                      home: FutureBuilder(
                        future: _initFuture,
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.done) {
                            return HomePage();
                          } else {
                            return SplashScreen();
                          }
                        },
                      ),
                    ))));
  }
}

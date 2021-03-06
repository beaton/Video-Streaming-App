import 'package:global_configuration/global_configuration.dart';
import 'package:video_streamer/data/movieProvider.dart';

/// Note the async keyword in the function declaration.
/// Many initialization routines are built to run asynchronously.
/// To being able to wait for those to finish we use the await keyword.
/// This requires our initialize function to also be in an async context.
/// Async functions implicitly return a Future.
/// A Future can be seen as an object that contains information about the state of an async function.

class Init {
  static Future initialize() async {
    await _registerServices();
    await _loadSettings();
  }

  // Load global services for the application.
  static _registerServices() async {
    print("starting registering services");

    /// Initialize the MovieDataProvider class.
    GlobalConfiguration cfg = new GlobalConfiguration();
    await cfg.loadFromAsset("properties.json");
    MovieProvider.instance.cfg = cfg;
    await MovieProvider.instance.init();
  }

  // Load global property settings for the application.
  static _loadSettings() async {
    print("starting loading settings");
  }
}
